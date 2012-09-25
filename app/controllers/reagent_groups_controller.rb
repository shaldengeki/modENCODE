class ReagentGroupsController < ApplicationController
  load_and_authorize_resource
  # GET /reagent_groups
  # GET /reagent_groups.json
  def index
    @reagent_groups = ReagentGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagent_groups }
    end
  end

  # GET /reagent_groups/1
  # GET /reagent_groups/1.json
  def show
    @reagent_group = ReagentGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent_group }
    end
  end

  # GET /reagent_groups/new
  # GET /reagent_groups/new.json
  def new
    @reagent_group = ReagentGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent_group }
    end
  end

  # GET /reagent_groups/1/edit
  def edit
    @reagent_group = ReagentGroup.find(params[:id])
  end

  # POST /reagent_groups
  # POST /reagent_groups.json
  def create
    @reagent_group = ReagentGroup.new(params[:reagent_group])
    unless @reagent_group.users.include? current_user
      @reagent_group.users << current_user
    end
    respond_to do |format|
      if @reagent_group.save
        format.html { redirect_to @reagent_group, notice: 'Reagent group was successfully created.' }
        format.json { render json: @reagent_group, status: :created, location: @reagent_group }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent_group.errors, status: :unprocessable_entity }
      end
    end
  end
  def start_batch
    @reagent_group = ReagentGroup.new(:gene_type_id => 1, :reagent_type_id => 1)
    unless @reagent_group.users.include? current_user
      @reagent_group.users << current_user
    end
    respond_to do |format|
      format.html # start_batch.html.erb
      format.json { render json: @reagent_groups }
    end
  end
  def review_batch
    begin
      ActiveRecord::Base.transaction do
        # first, initialize the reagent group.
        @reagent_group = ReagentGroup.new(params[:reagent_group])
        @reagents = []
        tf_list = []
        newReagentList = []
        # loop over all the entries in the text list, pushing candidate genes onto a list.
        unless params[:transcription_factors_text_list].blank?
          params[:transcription_factors_text_list][0].strip.split.each do |gene_name|
            find_tf = nil
            find_alias = Alias.find_by_name(gene_name)
            find_tf = TranscriptionFactor.find_by_flybase_id(gene_name) if find_alias.nil?
            find_tf = TranscriptionFactor.find_by_cg_id(gene_name) if find_tf.nil?
            find_tf = TranscriptionFactor.find_by_refseq_id(gene_name) if find_tf.nil?
            find_tf = TranscriptionFactor.find_by_entrez_id(gene_name) if find_tf.nil?
            find_tf = TranscriptionFactor.find_by_hgnc_id(gene_name) if find_tf.nil?
            find_tf = TranscriptionFactor.find_by_ensembl_id(gene_name) if find_tf.nil?

            tf_list.push({:isoforms => [], :transcription_factor => TranscriptionFactor.find(find_alias.transcription_factor_id)}) unless find_alias.nil?
            tf_list.push({:isoforms => [], :transcription_factor => find_tf}) unless find_tf.nil?
          end
        end
        # push candidate genes from the select list.
        unless params[:transcription_factors_select_list].blank?
          params[:transcription_factors_select_list].each do |key,value|
            value.to_i.times do
              tf_list.push({:isoforms => [], :transcription_factor => TranscriptionFactor.find(key)})
            end
          end
        end
        # push candidate genes with parameters from the uploaded spreadsheet.
        unless params[:reagent_group][:spreadsheet_file].blank?
          # since roo uses file extension to determine type, we need to copy the uploaded file to the original filename.
          tmp = params[:reagent_group][:spreadsheet_file].tempfile
          file = File.join(File.dirname(tmp.path), params[:reagent_group][:spreadsheet_file].original_filename)
          FileUtils.cp tmp.path, file

          # now parse the uploaded spreadsheet.
          # params[:file] = file
          bar = Spreadsheet.open(file)
          worksheet = bar.worksheets.first

          # load a list of target attributes to search against.
          target_attributes = Hash.new
          target_methods = Reagent.public_instance_methods
          target_methods.each do |method|
            # if this is an object, set its search method properly.
            begin
              target_attributes[method.to_s] = method.to_s.singularize.camelize.constantize
            rescue NameError
              target_attributes[method.to_s] = method.to_s
            end
          end
          Reagent.columns.each do |column|
            if column.sql_type == "int(11)" and column.name.end_with? "_id"
              # this is a nested model ID.
              attributeName = column.name[0..-4]
              tableName = attributeName.pluralize
              attributeObject = attributeName.camelize.constantize
              target_attributes[attributeName] = attributeObject
            else
              target_attributes[column.name] = column.name
            end
          end
          ReagentAttribute.all.each do |attribute|
            target_attributes[attribute.name] =  ReagentAttribute
          end
          target_attributes["gene"] = "transcription_factor_name"
          # params[:target_attributes] = target_attributes

          # get column headers and set target attributes.
          column_headers = {}
          for column in worksheet.dimensions[2]..(worksheet.dimensions[3]-1) do
            header = worksheet.cell(worksheet.dimensions[0], column)
            unless target_attributes.include? header
              header = header.pluralize
            end
            if target_attributes.include? header
              column_headers[column] = target_attributes[header]
            end
          end
          # params[:column_headers] = column_headers
          # params[:foo] = []
          # now create reagents for each row based on these attributes.
          reagent_i = 1
          start_row = worksheet.dimensions[0]+1
          end_row = worksheet.dimensions[1]
          for row in start_row..end_row do
            if worksheet.cell(row, worksheet.dimensions[2]).blank?
              next
            end
            prospectiveReagent = Reagent.new
            for column in worksheet.dimensions[2]..(worksheet.dimensions[3]-1) do
              unless worksheet.cell(row, column).blank?
                if column_headers.include? column
                  if column_headers[column].is_a? String
                    value = worksheet.cell(row, column)
                    idField = column_headers[column]
                  else
                    findIDEntry = column_headers[column].where('name LIKE :name', :name => "%#{worksheet.cell(row, column).downcase}%").limit(1).all
                    # params[:foo].push({'column'=> column, 'header'=> column_headers[column], 'name'=> worksheet.cell(row, column), 'idEntry'=> findIDEntry})
                    unless findIDEntry.empty?
                      value = findIDEntry.first.id
                      idField = column_headers[column].name.underscore + '_id'
                      unless target_attributes.include? idField or target_attributes.include? column_headers[column].name.underscore
                        idField = idField.pluralize
                      end
                    end
                  end
                  columnValue = prospectiveReagent.send(idField)
                  if columnValue.is_a? Array
                    prospectiveReagent.send("#{idField}=", columnValue.push(value))
                  else
                    prospectiveReagent.send("#{idField}=", value)
                  end
                end
              end
            end
            if prospectiveReagent.reagent_type_id.nil?
              prospectiveReagent.reagent_type_id = ReagentType.all.first.id
            end
            prospectiveReagent.name = prospectiveReagent.name + "-" + reagent_i.to_s
            reagent_i += 1
            newReagentList << prospectiveReagent
          end
          # params[:bal] = worksheet.cell(1,1)
        end
        params[:newReagentList] = newReagentList
        # pull the remaining genes down from the queue.
        num_from_queue = (params[:reagent_group][:total_reagents].to_i - newReagentList.length)
        num_from_queue = 0 if num_from_queue < 0
        # TODO: make this not awful.
        case params[:reagent_group][:sort_by]
          when "flag"
            params[:reagent_group][:sort_by] = "flag"
          when "fpkm"
            params[:reagent_group][:sort_by] = "fpkm_r1"
          when "frac"
            params[:reagent_group][:sort_by] = "frac_r1"
          else
            params[:reagent_group][:sort_by] = "name"
        end
        case params[:reagent_group][:sort_order]
          when "ASC"
            params[:reagent_group][:sort_order] = "ASC"
          else
            params[:reagent_group][:sort_order] = "DESC"
        end

        if num_from_queue > 0
          Isoform.joins('LEFT JOIN transcription_factors ON transcription_factors.id = isoforms.transcription_factor_id').where('transcription_factors.gene_type_id = :gene_type_id', :gene_type_id => params[:reagent_group][:gene_type_id]).where('transcription_factors.id not in (?)', tf_list.map{|tf| tf[:transcription_factor].id}).where("isoforms." + params[:reagent_group][:sort_by] + " IS NOT NULL").order("isoforms." + params[:reagent_group][:sort_by] + ' ' + params[:reagent_group][:sort_order]).limit(num_from_queue).each do |isoform|
            tf_list.push({:isoforms => [isoform], :transcription_factor => isoform.transcription_factor})
          end
        end
        # now create reagents and add them to an initialized reagent group.
        i = 1
        tf_list.each do |this_gene|
          new_number = ("%0" + Math.log10(tf_list.length.to_i).ceil.to_s + "d") % i
          new_name = params[:reagent_group][:name] + "-" + this_gene[:transcription_factor].name + "-" + new_number
          new_description = this_gene[:transcription_factor].name
          @reagent = Reagent.new(:name => new_name,
                                 :description => new_description,
                                 :source_id => current_user.source.id,
                                 :reagent_type_id => params[:reagent_group][:reagent_type_id],
                                 :reagent_groups => [@reagent_group])
          unless this_gene[:isoforms].empty?
            @reagent.isoforms = this_gene[:isoforms]
          end
          newReagentList << @reagent
          i += 1
        end
        # add appropriate isoforms to each reagent.
        params[:addedIsoforms] = []
        params[:newReagentIsoforms] = []
        newReagentList.each_with_index do |reagent, key|
          params[:newReagentIsoforms] << reagent.isoforms
          unless key.nil? or reagent.isoforms.empty?
            # add all isoforms that converge at the same stop codon as any of these isoforms.
            reagent.isoforms.each do |isoform|
              params[:addedIsoforms] << isoform
              unless isoform.stop_codon_end.blank?
                Isoform.where(:stop_codon_end => isoform.stop_codon_end).all.each do |addIsoform|
                  unless newReagentList[key].isoforms.include? addIsoform
                    newReagentList[key].isoforms << addIsoform
                  end
                end
              end
            end
          end
        end

        @reagent_group.reagents = newReagentList
      end
    rescue ActiveRecord::RecordInvalid => invalid
      respond_to do |format|
        format.html {render action: "start_batch"}
      end
    else
      respond_to do |format|
        format.html # review_batch.html.erb
        format.json { render json: @reagent_groups }
      end
    end
  end
  def submit_batch
    @reagent_group = ReagentGroup.create(params[:reagent_group])
    respond_to do |format|
      format.html { redirect_to @reagent_group, notice: 'Successfully created batch.'}
      format.json { render json: @reagent_group }
    end
  end

  # PUT /reagent_groups/1
  # PUT /reagent_groups/1.json
  def update
    @reagent_group = ReagentGroup.find(params[:id])

    respond_to do |format|
      if @reagent_group.update_attributes(params[:reagent_group])
        format.html { redirect_to @reagent_group, notice: 'Reagent group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagent_groups/1
  # DELETE /reagent_groups/1.json
  def destroy
    @reagent_group = ReagentGroup.find(params[:id])
    @reagent_group.destroy

    respond_to do |format|
      format.html { redirect_to reagent_groups_url }
      format.json { head :no_content }
    end
  end
end
