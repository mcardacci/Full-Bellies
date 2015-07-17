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

  private

    def vendor_params
      params.require(:vendor).permit(:username, :password, :email, :name, :address)
    end

end
