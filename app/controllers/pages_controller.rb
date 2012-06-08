class PagesController < ApplicationController
  skip_authorization_check
  def dashboard
    getCompletionProgress()
    @attempt = Attempt.new
    @attempt.statuses.build
  end

  def completionProgress
    getCompletionProgress()
    render :json => @pieChartData
  end

  def contact
  end
end
