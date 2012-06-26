class ReagentsController < ApplicationController
  load_and_authorize_resource
  autocomplete :reagent, :name, :extra_data => [:reagent_type_id]
  before_filter :generate_new_reagent, :only => [:index, :show, :search, :new]
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

  def search
    reagent_params = params[:reagent]
    @reagents = []
    unless reagent_params.nil? or reagent_params.empty?
      if reagent_params[:reagent_type_id].nil? or reagent_params[:reagent_type_id].blank?
        @reagents = Reagent.all
      else
        @reagents = Reagent.where(:reagent_type_id => reagent_params[:reagent_type_id].to_i)
      end
      unless reagent_params[:isoform_ids].nil? or reagent_params[:isoform_ids].empty?
        isoform_ids = Array(reagent_params[:isoform_ids].select{|value| !value.blank?})
        isoform_ids.each do |isoform_id|
          @reagents = @reagents.select{|reagent| reagent.isoforms.map{|isoform| isoform.id}.include? isoform_id.to_i}
        end
      end
      unless reagent_params[:reagent_values_attributes].nil? or reagent_params[:reagent_values_attributes].empty?
        values = Array(reagent_params[:reagent_values_attributes]).select{|value| !value[:value].blank? }
        values.each do |value|
          @reagents = @reagents.select{|reagent| ReagentValue.where(:reagent_id => reagent.id.to_i, :reagent_attribute_id => value[:reagent_attribute_id].to_i, :value => value[:value].to_s).count > 0}
        end
      end
      unless reagent_params[:status].nil? or reagent_params[:status].empty?
        unless reagent_params[:status][:step_id].nil? or reagent_params[:status][:step_id].blank?
          attempts = Attempt.all.select{|attempt| attempt.last_step == reagent_params[:status][:step_id].to_i}
          @reagents = @reagents & attempts.map{|attempt| attempt.reagent}
        end
      end
    end
    # @reagents = @reagents.map{|reagent| Reagent.find(reagent)}

    respond_to do |format|
      format.html
    end
  end

  def search_by_isoforms
    isoforms = ActiveSupport::JSON.decode(params[:isoforms])
    @reagents = Isoform.find(isoforms.first).reagents
    isoforms.drop(1).each do |isoform|
      @reagents = @reagents & Isoform.find(isoform).reagents
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /reagents/new
  # GET /reagents/new.json
  def new
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
  private
    def generate_new_reagent
      @reagent = Reagent.new
    end
end
