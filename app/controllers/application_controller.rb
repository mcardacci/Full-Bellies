class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def vendor_logged_in?
    !!session[:vendor_id]
  end

  def user_logged_in?
    !!session[:user_id]
  end

  def require_vendor_login
    unless vendor_logged_in?
      flash[:notice] = "You must be logged in as a vendor to access that."
      redirect_to deals_path
    end
  end

  def require_user_login
    unless user_logged_in?
      flash[:notice] = "Must be logged in as a user to access that."
      redirect_to deals_path
    end
  end

  def current_vendor
    return Vendor.find(session[:vendor_id]) if vendor_logged_in?
  end
end
