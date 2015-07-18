require 'rails_helper'

describe DealsController do
  before(:each) do
    @deal = create(:deal)
  end

  describe 'GET #index' do
    it "shows a list of all deals" do
      deal = create(:deal)
      get :index
      expect(assigns(:deals)).to match_array [@deal, deal]
    end
  end

end

  # it "collects users into @users" do
#     user = create(:user)
#     get :index
#     expect(assigns(:users)).to match_array [@user,user]
#   end

#   it "renders the :index template" do
#     get :index
#     expect(response).to render_template :index
#   end
# end

# before :each do
#   @user = create(:user)
#   session[:user_id] = @user.id
# end