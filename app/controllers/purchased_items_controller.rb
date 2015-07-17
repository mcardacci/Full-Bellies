class PurchasedItemsController < ApplicationController
  def new
    @deal = Deal.find(params[:deal_id])
    @purchased_item = PurchasedItem.new
  end

  def create
    deal = Deal.find(params[:deal_id])
    purchased_item = PurchasedItem.create(purchased_item_params)
    purchased_item.update_attributes(price: calculate_price(params[:quantity], deal), user_id: current_user.id)

    binding.pry


    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => calculate_price(params[:quantity], deal),
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    redirect_to user_path(current_user.id)
  end

  private

  def purchased_item_params
    params.permit(:deal_id, :title,:description,:quantity)
  end

  def calculate_price(quantity, deal)
    return quantity * deal.item_price
  end

  def current_user
    return User.find(session[:user_id]) if !!session[:user_id]
  end


end