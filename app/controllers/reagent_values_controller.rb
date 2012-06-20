class ReagentValuesController < ApplicationController
  load_and_authorize_resource
  # GET /reagent_values
  # GET /reagent_values.json
  def index
    @reagent_values = ReagentValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagent_values }
    end
  end

  # GET /reagent_values/1
  # GET /reagent_values/1.json
  def show
    @reagent_value = ReagentValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent_value }
    end
  end

  # GET /reagent_values/new
  # GET /reagent_values/new.json
  def new
    @reagent_value = ReagentValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent_value }
    end
  end

  # GET /reagent_values/1/edit
  def edit
    @reagent_value = ReagentValue.find(params[:id])
  end

  # POST /reagent_values
  # POST /reagent_values.json
  def create
    @reagent_value = ReagentValue.new(params[:reagent_value])

    respond_to do |format|
      if @reagent_value.save
        format.html { redirect_to @reagent_value, notice: 'Reagent value was successfully created.' }
        format.json { render json: @reagent_value, status: :created, location: @reagent_value }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reagent_values/1
  # PUT /reagent_values/1.json
  def update
    @reagent_value = ReagentValue.find(params[:id])

    respond_to do |format|
      if @reagent_value.update_attributes(params[:reagent_value])
        format.html { redirect_to @reagent_value, notice: 'Reagent value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagent_values/1
  # DELETE /reagent_values/1.json
  def destroy
    @reagent_value = ReagentValue.find(params[:id])
    @reagent_value.destroy

    respond_to do |format|
      format.html { redirect_to reagent_values_url }
      format.json { head :no_content }
    end
  end
end
