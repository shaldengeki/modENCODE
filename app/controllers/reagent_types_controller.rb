class ReagentTypesController < ApplicationController
  load_and_authorize_resource
  # GET /reagent_types
  # GET /reagent_types.json
  def index
    @reagent_types = ReagentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagent_types }
    end
  end

  # GET /reagent_types/1
  # GET /reagent_types/1.json
  def show
    @reagent_type = ReagentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent_type }
    end
  end

  def get_attributes
    @reagent = Reagent.find_by_id(params[:reagent])
    if @reagent.nil?
      @reagent = Reagent.new
      @reagent_attributes = ReagentAttribute.where(:reagent_type_id => params[:reagent_type]).all
    else
      reagent_existing_attr_ids = @reagent.reagent_values.map{|val| val.reagent_attribute_id.to_i}
      @reagent_attributes = ReagentAttribute.where(:reagent_type_id => params[:reagent_type])
      unless @reagent.reagent_values.empty?
        @reagent_attributes = @reagent_attributes.where('id NOT IN (?)', reagent_existing_attr_ids)
      end
      @reagent_attributes = @reagent_attributes.all
    end
    blank_reagent_values = @reagent_attributes.map{|attr| ReagentValue.new(:reagent_attribute_id => attr.id, :value => "")}
    blank_reagent_values.each do |val|
      @reagent.reagent_values.build(:reagent_attribute_id => val.reagent_attribute_id, :value => "")
    end
    @reagent.reagent_values.sort!{|a, b| a.reagent_attribute_id <=> b.reagent_attribute_id}
    respond_to do |format|
      format.js
    end
  end


  # GET /reagent_types/new
  # GET /reagent_types/new.json
  def new
    @reagent_type = ReagentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent_type }
    end
  end

  # GET /reagent_types/1/edit
  def edit
    @reagent_type = ReagentType.find(params[:id])
  end

  # POST /reagent_types
  # POST /reagent_types.json
  def create
    @reagent_type = ReagentType.new(params[:reagent_type])

    respond_to do |format|
      if @reagent_type.save
        format.html { redirect_to @reagent_type, notice: 'Reagent type was successfully created.' }
        format.json { render json: @reagent_type, status: :created, location: @reagent_type }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reagent_types/1
  # PUT /reagent_types/1.json
  def update
    @reagent_type = ReagentType.find(params[:id])

    respond_to do |format|
      if @reagent_type.update_attributes(params[:reagent_type])
        format.html { redirect_to @reagent_type, notice: 'Reagent type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagent_types/1
  # DELETE /reagent_types/1.json
  def destroy
    @reagent_type = ReagentType.find(params[:id])
    @reagent_type.destroy

    respond_to do |format|
      format.html { redirect_to reagent_types_url }
      format.json { head :no_content }
    end
  end
end
