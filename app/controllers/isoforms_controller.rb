class IsoformsController < ApplicationController
  load_and_authorize_resource
  before_filter :generate_new_isoform, :only => [:index, :show, :new]
  # GET /isoforms
  # GET /isoforms.json
  def index
    @isoforms = Isoform.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @isoforms }
    end
  end

  # GET /isoforms/1
  # GET /isoforms/1.json
  def show
    @isoform = Isoform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @isoform }
    end
  end

  # GET /isoforms/new
  # GET /isoforms/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @isoform }
    end
  end

  # GET /isoforms/1/edit
  def edit
    @isoform = Isoform.find(params[:id])
  end

  # POST /isoforms
  # POST /isoforms.json
  def create
    @isoform = Isoform.new(params[:isoform])

    respond_to do |format|
      if @isoform.save
        format.html { redirect_to @isoform, notice: 'Isoform was successfully created.' }
        format.json { render json: @isoform, status: :created, location: @isoform }
      else
        format.html { render action: "new" }
        format.json { render json: @isoform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /isoforms/1
  # PUT /isoforms/1.json
  def update
    @isoform = Isoform.find(params[:id])

    respond_to do |format|
      if @isoform.update_attributes(params[:isoform])
        format.html { redirect_to @isoform, notice: 'Isoform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @isoform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /isoforms/1
  # DELETE /isoforms/1.json
  def destroy
    @isoform = Isoform.find(params[:id])
    @isoform.destroy

    respond_to do |format|
      format.html { redirect_to isoforms_url }
      format.json { head :no_content }
    end
  end
  private
    def generate_new_isoform
      @isoform = Isoform.new
    end
end
