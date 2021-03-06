class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include PagesHelper
  check_authorization
  def help
    Helper.instance
  end
  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You are not allowed to perform #{exception.action.nil? ? 'this action' : exception.action} on #{exception.subject.class.column_names.include?(:name) ? exception.subject.name : exception.subject.class.name}."
  end
end