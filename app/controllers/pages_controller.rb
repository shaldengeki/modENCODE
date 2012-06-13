class PagesController < ApplicationController
  skip_authorization_check
  def dashboard
    getCompletionProgress()
    @attempt = Attempt.new
    @attempt.statuses.build
    @status = Status.new
    @transcriptionFactors = TranscriptionFactor.all
    @latestUpdatedTFs = TranscriptionFactor.joins(:isoforms => {:reagents => {:attempts => :statuses}}).order("statuses.id DESC").group("transcription_factors.id").limit(5).all
    @latestStatuses = Status.order("id DESC").limit(5)
  end

  def completionProgress
    getCompletionProgress()
    render :json => @pieChartData
  end

  def contact
  end
end
