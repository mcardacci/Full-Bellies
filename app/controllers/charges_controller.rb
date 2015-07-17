class ChargesController < ApplicationController

	def index
	  @price_header = "($00.50)"
	  @price_btn = 50
	end

	def create
       	  # set hidden field in form and capture the @amount in params
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
	  
	  redirect_to deals_path
    
  end
end
