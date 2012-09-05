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
        # loop over all the entries in the text list, pushing candidate genes onto a list.
        unless params[:transcription_factors_text_list].blank?
          params[:transcription_factors_text_list][0].strip.split.each do |gene_name|
            find_tf = nil
            find_alias = Alias.find_by_name(gene_name)
            find_tf = TranscriptionFactor.find_by_flybase_id(gene_name) if find_alias.nil?
            find_tf = TranscriptionFactor.find_by_cg_id(gene_name) if find_tf.nil?
            find_tf = TranscriptionFactor.find_by_refseq_id(gene_name) if find_tf.nil?

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
        # pull the remaining genes down from the queue.
        num_from_queue = (params[:reagent_group][:total_reagents].to_i - tf_list.length)
        num_from_queue = 0 if num_from_queue < 0
        # TODO: make this not awful.
        case params[:reagent_group][:sort_by]
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

        Isoform.joins('LEFT JOIN transcription_factors ON transcription_factors.id = isoforms.transcription_factor_id').where('transcription_factors.gene_type_id = :gene_type_id', :gene_type_id => params[:reagent_group][:gene_type_id]).where('transcription_factors.id not in (?)', tf_list.map{|tf| tf[:transcription_factor].id}).where("isoforms." + params[:reagent_group][:sort_by] + " IS NOT NULL").order("isoforms." + params[:reagent_group][:sort_by] + ' ' + params[:reagent_group][:sort_order]).limit(num_from_queue).each do |isoform|
          tf_list.push({:isoforms => [isoform], :transcription_factor => isoform.transcription_factor})
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
          @reagent_group.reagents << @reagent
          i += 1
        end
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
