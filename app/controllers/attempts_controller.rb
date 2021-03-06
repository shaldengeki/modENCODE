class AttemptsController < ApplicationController
  load_and_authorize_resource
  before_filter :generate_new_attempt, :only => [:index, :show, :search, :new]
  before_filter :generate_new_status, :only => [:index, :search]
  # GET /attempts
  # GET /attempts.json
  def index
    @attempts = Attempt.order('updated_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attempts }
    end
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
    @attempt = Attempt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attempt }
    end
  end

  def search
    attempt_params = params[:attempt]
    @attempts = Attempt.all
    unless attempt_params.nil? or attempt_params.empty?
      unless attempt_params[:isoform_ids].nil? or attempt_params[:isoform_ids].empty?
        isoform_ids = Array(attempt_params[:isoform_ids].select{|value| !value.blank?})
        isoform_ids.each do |isoform_id|
          @attempts = @attempts.select{|attempt| attempt.reagent.isoforms.map{|isoform| isoform.id}.include? isoform_id.to_i}
        end
      end
      unless attempt_params[:attempt_values_attributes].nil? or attempt_params[:attempt_values_attributes].empty?
        values = Array(attempt_params[:attempt_values_attributes]).select{|value| !value[:value].blank? }
        values.each do |value|
          @attempts = @attempts.select{|attempt| AttemptValue.where(:attempt_id => attempt.id.to_i, :attempt_attribute_id => value[:attempt_attribute_id].to_i, :value => value[:value].to_s).count > 0}
        end
      end
      unless attempt_params[:status].nil? or attempt_params[:status].empty?
        unless attempt_params[:status][:step_id].nil? or attempt_params[:status][:step_id].blank?
          attempts = Attempt.all.select{|attempt| attempt.last_step == attempt_params[:status][:step_id].to_i}
          @attempts = @attempts & attempts
        end
      end
    end
    # @attempts = @attempts.map{|attempt| Attempt.find(attempt)}

    respond_to do |format|
      format.html
    end
  end

  # GET /attempts/new
  # GET /attempts/new.json
  def new
    @attempt.statuses.build
    @attempt.attempt_attributes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attempt }
    end
  end

  # GET /attempts/1/edit
  def edit
    @attempt = Attempt.find(params[:id])
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new(params[:attempt])
    @attempt.users.append(current_user) unless @attempt.users.include? current_user
    @attempt.statuses.each do |status|
      status[:start] = 1
      status[:user_id] = current_user.id
      status[:started_at] = DateTime.now
    end
    respond_to do |format|
      if @attempt.save and @attempt.update_attributes(:attempt_values => params[:attempt][:attempt_values_attributes])
        format.html { redirect_to @attempt, notice: 'Attempt was successfully created.' }
        format.json { render json: @attempt, status: :created, location: @attempt }
      else
        format.html { render action: "new" }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attempts/1
  # PUT /attempts/1.json
  def update
    @attempt = Attempt.find(params[:id])
    respond_to do |format|
      if @attempt.update_attributes(:attempt_values => params[:attempt][:attempt_values_attributes]) and @attempt.update_attributes(params[:attempt])
        format.html { redirect_to @attempt, notice: 'Attempt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt = Attempt.find(params[:id])
    @attempt.destroy

    respond_to do |format|
      format.html { redirect_to attempts_url }
      format.json { head :no_content }
    end
  end

  private
    def generate_new_attempt
      @attempt = Attempt.new
    end
    def generate_new_status
      @status = Status.new
    end
end
