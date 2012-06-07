class ReagentAttributesController < ApplicationController
  # GET /reagent_attributes
  # GET /reagent_attributes.json
  def index
    @reagent_attributes = ReagentAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagent_attributes }
    end
  end

  # GET /reagent_attributes/1
  # GET /reagent_attributes/1.json
  def show
    @reagent_attribute = ReagentAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent_attribute }
    end
  end

  # GET /reagent_attributes/new
  # GET /reagent_attributes/new.json
  def new
    @reagent_attribute = ReagentAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent_attribute }
    end
  end

  # GET /reagent_attributes/1/edit
  def edit
    @reagent_attribute = ReagentAttribute.find(params[:id])
  end

  # POST /reagent_attributes
  # POST /reagent_attributes.json
  def create
    @reagent_attribute = ReagentAttribute.new(params[:reagent_attribute])

    respond_to do |format|
      if @reagent_attribute.save
        format.html { redirect_to @reagent_attribute, notice: 'Reagent attribute was successfully created.' }
        format.json { render json: @reagent_attribute, status: :created, location: @reagent_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reagent_attributes/1
  # PUT /reagent_attributes/1.json
  def update
    @reagent_attribute = ReagentAttribute.find(params[:id])

    respond_to do |format|
      if @reagent_attribute.update_attributes(params[:reagent_attribute])
        format.html { redirect_to @reagent_attribute, notice: 'Reagent attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagent_attributes/1
  # DELETE /reagent_attributes/1.json
  def destroy
    @reagent_attribute = ReagentAttribute.find(params[:id])
    @reagent_attribute.destroy

    respond_to do |format|
      format.html { redirect_to reagent_attributes_url }
      format.json { head :no_content }
    end
  end
end
