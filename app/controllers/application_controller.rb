class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  check_authorization
  def help
    Helper.instance
  end
  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You are not allowed to #{exception.action} #{help.pluralize(1, exception.subject.name)}."
  end
end