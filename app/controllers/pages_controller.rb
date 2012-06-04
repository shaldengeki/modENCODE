class PagesController < ApplicationController
  skip_authorization_check
  def dashboard
    getCompletionProgress()
  end

  def completionProgress
    getCompletionProgress()
    render :json => @pieChartData
  end

  def contact
  end
end
