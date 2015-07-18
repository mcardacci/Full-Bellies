class SessionsController < ApplicationController

  def new
    @vendor = Vendor.new
    @user = User.new
  end

  def user_create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to deals_path
    else
      redirect_to new_session_path
    end
  end

  def vendor_create
    vendor = Vendor.find_by(username: vendor_params[:username])
    if vendor && vendor.authenticate(vendor_params[:password])
      session[:vendor_id] = vendor.id
      redirect_to vendor_path(vendor.id)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:vendor_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def vendor_params
      params.require(:vendor).permit(:username, :password)
    end

end
