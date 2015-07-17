class ChargesController < ApplicationController

	def create
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

	# rescue Stripe::CardError => e
 #    @user.errors.add :base, e.message
 #    @user.stripe_token = nil
 #    render :action => :new

 #  rescue Stripe::StripeError => e
 #    logger.error e.message
 #    @user.errors.add :base, "There was a problem with your credit card"
 #    @user.stripe_token = nil
 #    render :action => :new
    
  end
end