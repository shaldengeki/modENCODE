class AttemptAttributesController < ApplicationController
  load_and_authorize_resource
  autocomplete :attempt_attribute, :name
  # GET /attempt_attributes
  # GET /attempt_attributes.json
  def index
    @attempt_attributes = AttemptAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attempt_attributes }
    end
  end

  # GET /attempt_attributes/1
  # GET /attempt_attributes/1.json
  def show
    @attempt_attribute = AttemptAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attempt_attribute }
    end
  end

  # GET /attempt_attributes/new
  # GET /attempt_attributes/new.json
  def new
    @attempt_attribute = AttemptAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attempt_attribute }
    end
  end

  # GET /attempt_attributes/1/edit
  def edit
    @attempt_attribute = AttemptAttribute.find(params[:id])
  end

  # POST /attempt_attributes
  # POST /attempt_attributes.json
  def create
    @attempt_attribute = AttemptAttribute.new(params[:attempt_attribute])

    respond_to do |format|
      if @attempt_attribute.save
        format.html { redirect_to @attempt_attribute, notice: 'Attempt attribute was successfully created.' }
        format.json { render json: @attempt_attribute, status: :created, location: @attempt_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @attempt_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attempt_attributes/1
  # PUT /attempt_attributes/1.json
  def update
    @attempt_attribute = AttemptAttribute.find(params[:id])

    respond_to do |format|
      if @attempt_attribute.update_attributes(params[:attempt_attribute])
        format.html { redirect_to @attempt_attribute, notice: 'Attempt attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attempt_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempt_attributes/1
  # DELETE /attempt_attributes/1.json
  def destroy
    @attempt_attribute = AttemptAttribute.find(params[:id])
    @attempt_attribute.destroy

    respond_to do |format|
      format.html { redirect_to attempt_attributes_url }
      format.json { head :no_content }
    end
  end
end
