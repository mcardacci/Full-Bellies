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
      redirect_to root_path, flash[:notice] = "Successfully edited account"
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

  private

    def vendor_params
      params.require(:vendor).permit(:username, :password, :email, :name, :address)
    end

end
