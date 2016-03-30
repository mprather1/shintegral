class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id]
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(access_index_path) unless @user == current_user
  end

  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end

  def user_admin
    redirect_to(access_index_path) unless current_user && current_user.admin == true
  end


end
