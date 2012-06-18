class TranscriptionFactorsController < ApplicationController
  load_and_authorize_resource
  autocomplete :transcription_factor, :name
  before_filter :generate_new_transcription_factor, :only => [:index, :show, :new]
  # GET /transcription_factors
  # GET /transcription_factors.json
  def index
    @transcription_factors = TranscriptionFactor.order(:name).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transcription_factors }
    end
  end

  # GET /transcription_factors/1
  # GET /transcription_factors/1.json
  def show
    @transcription_factor = TranscriptionFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transcription_factor }
    end
  end

  def get_isoforms
    @transcription_factor = TranscriptionFactor.find(params[:id])
    @reagent = Reagent.new
    respond_to do |format|
      format.js
    end
  end

  # GET /transcription_factors/new
  # GET /transcription_factors/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transcription_factor }
    end
  end

  # GET /transcription_factors/1/edit
  def edit
    @transcription_factor = TranscriptionFactor.find(params[:id])
  end

  # POST /transcription_factors
  # POST /transcription_factors.json
  def create
    @transcription_factor = TranscriptionFactor.new(params[:transcription_factor])

    respond_to do |format|
      if @transcription_factor.save
        format.html { redirect_to @transcription_factor, notice: 'Transcription factor was successfully created.' }
        format.json { render json: @transcription_factor, status: :created, location: @transcription_factor }
      else
        format.html { render action: "new" }
        format.json { render json: @transcription_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transcription_factors/1
  # PUT /transcription_factors/1.json
  def update
    @transcription_factor = TranscriptionFactor.find(params[:id])

    respond_to do |format|
      if @transcription_factor.update_attributes(params[:transcription_factor])
        format.html { redirect_to @transcription_factor, notice: 'Transcription factor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transcription_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcription_factors/1
  # DELETE /transcription_factors/1.json
  def destroy
    @transcription_factor = TranscriptionFactor.find(params[:id])
    @transcription_factor.destroy

    respond_to do |format|
      format.html { redirect_to transcription_factors_url }
      format.json { head :no_content }
    end
  end
  private
    def generate_new_transcription_factor
      @transcription_factor = TranscriptionFactor.new
    end
end
