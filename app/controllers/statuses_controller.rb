class StatusesController < ApplicationController
  load_and_authorize_resource
  before_filter :generate_new_status, :only => [:index, :show, :new]
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.order("updated_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    if params[:attempt_ids] and params[:attempt_ids].is_json?
      # updating multiple attempt IDs with the same status.
      params[:status][:attempt_id] = JSON.parse(params[:attempt_ids])
      final_status = true
      params[:status][:attempt_id].each do |attempt_id|
        attempt = Attempt.find(attempt_id)
        unless attempt.user_ids.include? current_user.id
          attempt.user_ids = attempt.user_ids.append(current_user.id)
        end
        @status = Status.new(params[:status].except(:attempt_id, :position))
        @status.attempt_id = attempt_id
        @status.start = 0
        @status.position = @status.next_position
        @status.user_id = current_user.id
        final_status = final_status && @status.save && attempt.save
      end
    elsif params[:reagent_ids] and params[:reagent_ids].is_json?
      # creating / updating multiple attempts with the same status.
      final_status = true
      params[:reagent_ids] = JSON.parse(params[:reagent_ids])
      params[:reagent_ids].each do |reagent_id|
        targetReagent = Reagent.find(reagent_id)
        attempt = Attempt.where(:reagent_id => reagent_id).first
        params[:baby] = attempt
        unless attempt
          attempt = targetReagent.attempts.build()
          attempt.pipeline_id = Step.find(params[:status][:step_id]).pipeline.id
          params[:dont] = attempt
        end
        unless attempt.user_ids.include? current_user.id
          attempt.user_ids = attempt.user_ids.append(current_user.id)
          params[:hurt] = attempt
        end
        @status = attempt.statuses.build(params[:status].except(:attempt_id, :position))
        @status.user_id = current_user.id
        @status.start = 0
        @status.position = @status.next_position
        params[:me] = @status
        final_status = final_status && @status.save && attempt.save && targetReagent.save
        logger.debug @status.errors.full_messages
      end
    else
      attempt = Attempt.find(params[:status][:attempt_id])
      unless attempt.user_ids.include? current_user.id
        attempt.user_ids = attempt.user_ids.append(current_user.id)
      end
      @status = Status.new(params[:status].except(:position))
      @status.start = 0
      @status.position = @status.next_position
      @status.user_id = current_user.id
      final_status = @status.save && attempt.save
    end
    respond_to do |format|
      if final_status
        format.html { redirect_to @status, notice: 'Successfully updated attempt.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])
    respond_to do |format|
      if @status.update_attributes(params[:status].except(:position, :isoform_ids, :reagent_id))
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end
  private
    def generate_new_status
      @status = Status.new
    end
end
