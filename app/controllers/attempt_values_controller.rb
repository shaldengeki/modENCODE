class AttemptValuesController < ApplicationController
  load_and_authorize_resource
  # GET /attempt_values
  # GET /attempt_values.json
  def index
    @attempt_values = AttemptValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attempt_values }
    end
  end

  # GET /attempt_values/1
  # GET /attempt_values/1.json
  def show
    @attempt_value = AttemptValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attempt_value }
    end
  end

  # GET /attempt_values/new
  # GET /attempt_values/new.json
  def new
    @attempt_value = AttemptValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attempt_value }
    end
  end

  # GET /attempt_values/1/edit
  def edit
    @attempt_value = AttemptValue.find(params[:id])
  end

  # POST /attempt_values
  # POST /attempt_values.json
  def create
    @attempt_value = AttemptValue.new(params[:attempt_value])

    respond_to do |format|
      if @attempt_value.save
        format.html { redirect_to @attempt_value, notice: 'Attempt value was successfully created.' }
        format.json { render json: @attempt_value, status: :created, location: @attempt_value }
      else
        format.html { render action: "new" }
        format.json { render json: @attempt_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attempt_values/1
  # PUT /attempt_values/1.json
  def update
    @attempt_value = AttemptValue.find(params[:id])

    respond_to do |format|
      if @attempt_value.update_attributes(params[:attempt_value])
        format.html { redirect_to @attempt_value, notice: 'Attempt value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attempt_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempt_values/1
  # DELETE /attempt_values/1.json
  def destroy
    @attempt_value = AttemptValue.find(params[:id])
    @attempt_value.destroy

    respond_to do |format|
      format.html { redirect_to attempt_values_url }
      format.json { head :no_content }
    end
  end
end
