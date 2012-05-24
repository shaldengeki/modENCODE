class ReagentsController < ApplicationController
  # GET /reagents
  # GET /reagents.json
  def index
    @reagents = Reagent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagents }
    end
  end

  # GET /reagents/1
  # GET /reagents/1.json
  def show
    @reagent = Reagent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent }
    end
  end

  # GET /reagents/new
  # GET /reagents/new.json
  def new
    @reagent = Reagent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent }
    end
  end

  # GET /reagents/1/edit
  def edit
    @reagent = Reagent.find(params[:id])
  end

  # POST /reagents
  # POST /reagents.json
  def create
    @reagent = Reagent.new(params[:reagent])

    respond_to do |format|
      if @reagent.save
        format.html { redirect_to @reagent, notice: 'Reagent was successfully created.' }
        format.json { render json: @reagent, status: :created, location: @reagent }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reagents/1
  # PUT /reagents/1.json
  def update
    @reagent = Reagent.find(params[:id])

    respond_to do |format|
      if @reagent.update_attributes(params[:reagent])
        format.html { redirect_to @reagent, notice: 'Reagent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagents/1
  # DELETE /reagents/1.json
  def destroy
    @reagent = Reagent.find(params[:id])
    @reagent.destroy

    respond_to do |format|
      format.html { redirect_to reagents_url }
      format.json { head :no_content }
    end
  end
end
