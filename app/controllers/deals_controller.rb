class DealsController < ApplicationController

  def index
    @deals = Deal.order(created_at: :desc)
  end

  def new
    @deal = Deal.new

  end

  def create
    binding.pry
    @deal = Deal.new(deal_params)
    if @deal.update_attributes(vendor_id: current_vendor.id) && @deal.save
      redirect_to current_vendor
    else
      redirect_to :back
      flash[:notice] = "all fields are required."
    end

  end

  def edit
  end

  def update

  end

  def show

  end

  def destroy

  end

  private

    def deal_params
      params.require(:deal).permit(:title, :description, :item_quantity, :item_price)
    end

    def current_vendor
      return Vendor.find(session[:vendor_id])
    end

end