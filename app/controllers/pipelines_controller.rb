class PipelinesController < ApplicationController
  load_and_authorize_resource
  before_filter :generate_new_pipeline, :only => [:index, :show, :new]
  # GET /pipelines
  # GET /pipelines.json
  def index
    @pipelines = Pipeline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pipelines }
    end
  end

  # GET /pipelines/1
  # GET /pipelines/1.json
  def show
    @pipeline = Pipeline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pipeline }
    end
  end

  # GET /pipelines/new
  # GET /pipelines/new.json
  def new
    3.times { @pipeline.steps.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pipeline }
    end
  end

  # GET /pipelines/1/edit
  def edit
    @pipeline = Pipeline.find(params[:id])
  end

  # POST /pipelines
  # POST /pipelines.json
  def create
    @pipeline = Pipeline.new(params[:pipeline])

    respond_to do |format|
      if @pipeline.save
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully created.' }
        format.json { render json: @pipeline, status: :created, location: @pipeline }
      else
        format.html { render action: "new" }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pipelines/1
  # PUT /pipelines/1.json
  def update
    @pipeline = Pipeline.find(params[:id])

    respond_to do |format|
      if @pipeline.update_attributes(params[:pipeline])
        format.html { redirect_to @pipeline, notice: 'Pipeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipelines/1
  # DELETE /pipelines/1.json
  def destroy
    @pipeline = Pipeline.find(params[:id])
    @pipeline.destroy

    respond_to do |format|
      format.html { redirect_to pipelines_url }
      format.json { head :no_content }
    end
  end
  private
    def generate_new_pipeline
      @pipeline = Pipeline.new
    end
end
