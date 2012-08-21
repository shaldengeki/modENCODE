class GeneTypesController < ApplicationController
  load_and_authorize_resource
  # GET /gene_types
  # GET /gene_types.json
  def index
    @gene_types = GeneType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gene_types }
    end
  end

  # GET /gene_types/1
  # GET /gene_types/1.json
  def show
    @gene_type = GeneType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gene_type }
    end
  end

  # GET /gene_types/new
  # GET /gene_types/new.json
  def new
    @gene_type = GeneType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gene_type }
    end
  end

  # GET /gene_types/1/edit
  def edit
    @gene_type = GeneType.find(params[:id])
  end

  # POST /gene_types
  # POST /gene_types.json
  def create
    @gene_type = GeneType.new(params[:gene_type])

    respond_to do |format|
      if @gene_type.save
        format.html { redirect_to @gene_type, notice: 'Gene type was successfully created.' }
        format.json { render json: @gene_type, status: :created, location: @gene_type }
      else
        format.html { render action: "new" }
        format.json { render json: @gene_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gene_types/1
  # PUT /gene_types/1.json
  def update
    @gene_type = GeneType.find(params[:id])

    respond_to do |format|
      if @gene_type.update_attributes(params[:gene_type])
        format.html { redirect_to @gene_type, notice: 'Gene type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gene_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gene_types/1
  # DELETE /gene_types/1.json
  def destroy
    @gene_type = GeneType.find(params[:id])
    @gene_type.destroy

    respond_to do |format|
      format.html { redirect_to gene_types_url }
      format.json { head :no_content }
    end
  end
end
