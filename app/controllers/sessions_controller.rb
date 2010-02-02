# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead

  # render new.rhtml
  def new
  end

  def create
    self.current_user =
            User.authenticate(params[:login], params[:password])
    if logged_in?
      respond_to do |format|
        format.html do
          redirect_back_or_default('/')
          flash[:notice] = "Logged in successfully"
        end
        format.json  { render :text => "Logged in successfully", :status => 200 }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.json { render :text => "Login failed", :status => 401 }
      end
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    respond_to do |format|
      format.html do
        flash[:notice] = "You have been logged out."
        redirect_back_or_default('/')
      end
      format.json { render :text => "Logged out successfully", :status => 200 }
    end
  end
end
