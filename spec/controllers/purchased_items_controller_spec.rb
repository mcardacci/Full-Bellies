require 'rails_helper'

describe PurchasedItemsController do
  before(:each) do
    deal = create(:deal)
    @vendor = create(:vendor)
    @user = create(:user)
  end
  describe 'POST #create' do
    it "should return you to the current_user's profile" do
      deal = create(:deal)
      @vendor = create(:vendor)
      current_user = create(:user)
      session[:user_id] = current_user.id
      Stripe.stub(:api_key)
      Stripe::Charge.stub(:create)
      post :create, deal_id: deal.id, quantity: 1
      expect(response).to redirect_to user_path(current_user.id)
    end
  end
end