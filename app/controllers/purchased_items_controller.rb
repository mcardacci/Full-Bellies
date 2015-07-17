class PurchasedItemsController < ApplicationController
  def new
    @deal = Deal.find(params[:deal_id])
    @purchased_item = PurchasedItem.new
  end

  def create
    deal = Deal.find(params[:deal_id])

    binding.pry
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  end

  private


  def calculate_price(quantity, deal)
    return quantity * deal.price
  end


end