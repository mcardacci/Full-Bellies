class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
    if request.xhr?
      render(partial: 'new', object: @vendor)
    end
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      session[:vendor_id] = @vendor.id
      redirect_to vendor_path(@vendor)
    else
      flash[:notice] = "Your vendor name exists already"
      redirect_to new_vendor_path
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.assign_attributes(vendor_params)
    if @vendor.save
      flash[:notice] = "Successfully edited account"
      redirect_to vendor_path(@vendor)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    session[:vendor_id] = nil
    redirect_to root_path
  end

  def send_sms
    @vendor = Vendor.find(params[:id])
    @vendor.send_followers_sms
    redirect_to vendor_path(@vendor.id)
  end

  def email_followers
    @vendor = Vendor.find(params[:id])
    @users = @vendor.users
    UserMailer.email_followers(@users.pluck(:email)).deliver
    redirect_to @vendor
  end

  def follow
    @vendor = Vendor.find(params[:vendor_id])
    @followers = @vendor.favorite_vendors
    unless @followers.exists?(user_id: params[:id])
      @vendor.favorite_vendors.create(user_id: params[:id])
      redirect_to :back
      return
    end
    flash[:notice] = "somethings wrong"
    redirect_to :back
  end

  private

    def vendor_params
      params.require(:vendor).permit(:username, :password, :email, :name, :address, :phone_numbe)
    end

end
