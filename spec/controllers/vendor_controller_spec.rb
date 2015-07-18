require 'rails_helper'

	describe VendorsController do
		describe 'vendor access' do
			before :each do
				@vendor = create(:vendor)
				session[:vendor_id] = @vendor.id
			end
			describe '#new' do
				it "assigns a new vendor to @vendor" do
					get :new
					expect(assigns(:vendor)).to be_a_new(Vendor)
				end

				it "renders a 'new' template" do
					get :new
					expect(response).to render_template :new
			end
		end

		describe 'POST #create' do 
			context "with valid attributes" do
				it "saves the new vendor in the db" do
					expect{ post :create, vendor: attributes_for(:vendor)}.to change(Vendor, :count).by(1)
				end

				it "redirects to vendors#show" do
					post :create, vendor: attributes_for(:vendor)
					expect(response).to redirect_to vendor_path(assigns[:vendor])
	 			end

	 			it "logs in vendor and sets session[vendor_id]" do
	 				post :create, vendor: attributes_for(:vendor)
	 				expect(session[:vendor_id]).to be_truthy
	 			end
			end

			context "with invalid attrs" do
				it "does not save the vendor in the db" do
					expect{ post :create, vendor: attributes_for(:invalid_vendor)}.not_to change(Vendor, :count)
				end

				it "redirects to new vendor signup" do
					post :create, vendor: attributes_for(:invalid_vendor)
					expect(response).to redirect_to new_vendor_path
				end
			end
		end

		describe "Get #show" do
			it "renders the :show template" do
				vendor = create(:vendor)
				get :show, id: vendor
				expect(response).to render_template :show
			end

			it "assigns the requested vendor to @vendor" do
				vendor = create(:vendor)
				get :show, id: vendor
				expect(assigns(:vendor)).to eq vendor
			end
		end

		describe "GET #edit" do
			it "assigns the requested vendor to @vendor" do
				vendor = create(:vendor)
				get :edit, id: vendor
				expect(assigns(:vendor)).to eq vendor
			end

			it "renders the :edit template" do
				vendor = create(:vendor)
				get :edit, id: vendor
				expect(response).to render_template :edit
			end
		end

		describe 'PUT #update' do
			before :each do 
				@vendor = create(:vendor, email: "marco@example.com", username: "marco")
			end

			context "valid attrs" do
				it "locates the requested @vendor" do
					put :update, id: @vendor, vendor: attributes_for(:vendor)
					expect(assigns(:vendor)).to eq @vendor
				end

				it "changes the contact's attrs" do
					put :update, id: @vendor, vendor: attributes_for(:vendor, email: "ross@example.com", username: "ross")
					@vendor.reload
					expect(@vendor.email).to eq "ross@example.com"
					expect(@vendor.username).to eq "ross"
				end

				it "redirects to the updated vendor" do
					put :update, id: @vendor, vendor: attributes_for(:vendor)
					expect(response).to redirect_to @vendor
				end
			end


			context "invalid attrs" do 
				it "locates the requested @vendor" do
					put :update, id: @vendor, vendor: attributes_for(:invalid_vendor)
					expect(assigns(:vendor)).to eq @vendor
				end

	      it "does not change the contact's attributes" do
	        put :update, id: @vendor, vendor: attributes_for(:vendor, username: "Larry", email: nil)
	        @vendor.reload
	        expect(@vendor.username).not_to eq("Larry")
	        expect(@vendor.email).to eq("marco@example.com")
	      end

	      it "re-renders the edit method" do
	        put :update, id: @vendor, vendor: attributes_for(:invalid_vendor)
	        expect(response).to render_template :edit
	      end
	    end
	  end

	  describe 'DELETE #destroy' do
	    before :each do
	      @vendor = create(:vendor)
	    end

	    it "deletes the vendor" do
	      expect{delete :destroy, id: @vendor}.to change(Vendor, :count).by(-1)
	    end

	    it "redirects to root path" do
	      delete :destroy, id: @vendor
	      expect(response).to redirect_to root_path
	    end
	  end
	end
end

