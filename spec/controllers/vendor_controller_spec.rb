require 'rails_helper'

describe VendorsController do
	describe 'vendor access' do
		before :each do
			@vendor = create(:vendor)
			session[:vendor_id] = @vendor.id
		end

		describe '#new' do
			it "assigns a new" do
				get :new
				expect(assigns(:vendor)).to be_a_new(Vendor)
			end
		end
	end
end