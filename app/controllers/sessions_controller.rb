class SessionsController < ApplicationController
  skip_authorization_check
  skip_load_and_authorize_resource
  def create
    user = User.find_by_email(params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome, " + user.name + "."
      redirect_to :controller => 'pages', :action => 'dashboard'
    else
      flash[:error] = 'Invalid email/password combination.'
      redirect_to root_path
    end
  end
  def destroy
    sign_out
    flash[:success] = "Successfully signed out."
    redirect_to root_path
  end
end
