class ReagentGroupsController < ApplicationController
  load_and_authorize_resource
  # GET /reagent_groups
  # GET /reagent_groups.json
  def index
    @reagent_groups = ReagentGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reagent_groups }
    end
  end

  # GET /reagent_groups/1
  # GET /reagent_groups/1.json
  def show
    @reagent_group = ReagentGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reagent_group }
    end
  end

  # GET /reagent_groups/new
  # GET /reagent_groups/new.json
  def new
    @reagent_group = ReagentGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reagent_group }
    end
  end

  # GET /reagent_groups/1/edit
  def edit
    @reagent_group = ReagentGroup.find(params[:id])
  end

  # POST /reagent_groups
  # POST /reagent_groups.json
  def create
    @reagent_group = ReagentGroup.new(params[:reagent_group])
    unless @reagent_group.users.include? current_user
      @reagent_group.users << current_user
    end
    respond_to do |format|
      if @reagent_group.save
        format.html { redirect_to @reagent_group, notice: 'Reagent group was successfully created.' }
        format.json { render json: @reagent_group, status: :created, location: @reagent_group }
      else
        format.html { render action: "new" }
        format.json { render json: @reagent_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reagent_groups/1
  # PUT /reagent_groups/1.json
  def update
    @reagent_group = ReagentGroup.find(params[:id])

    respond_to do |format|
      if @reagent_group.update_attributes(params[:reagent_group])
        format.html { redirect_to @reagent_group, notice: 'Reagent group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reagent_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reagent_groups/1
  # DELETE /reagent_groups/1.json
  def destroy
    @reagent_group = ReagentGroup.find(params[:id])
    @reagent_group.destroy

    respond_to do |format|
      format.html { redirect_to reagent_groups_url }
      format.json { head :no_content }
    end
  end
end
