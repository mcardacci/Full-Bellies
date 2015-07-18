require 'rails_helper'

describe DealsController do
  before(:each) do
    @deal = create(:deal)
    @vendor = create(:vendor)
    session[:vendor_id] = @vendor.id
  end

  describe 'GET #index' do
    it "shows a list of all deals" do
      deal = create(:deal)
      get :index
      expect(assigns(:deals)).to match_array [@deal, deal]
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "orders the deals in descending order" do
      deal = create(:deal)
      get :index
      expect(Deal.order('created_at desc')).to eq [deal, @deal]
    end
  end

  describe '#new' do
    it "assigns a new deal to @deal" do
      get :new
      expect(assigns(:deal)).to be_a_new(Deal)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before(:each) do
      # @end_time = Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i)
      # @end_time = {"deal" => {"end_time(1i)"=>"2016", "end_time(2i)"=>"7", "end_time(3i)"=>"18", "end_time(4i)"=>"18", "end_time(5i)"=>"05"}}
    end

    context "with valid attributes" do
      xit "saves the new deal into the database" do
        expect{ post :create, deal: attributes_for(:deal, vendor_id: @vendor.id, end_time: @end_time, item_quantity: 20, item_price: 1.50)}.to change(Deal, :count).by(1)
      end

      xit "redirects to the current vendor's profile page" do
        post :create, deal: attributes_for(:deal, vendor_id: @vendor.id)
        expect(response).to redirect_to vendor_path(@vendor)
      end
    end

    context "with invalid attributes" do
      xit "does not save the deal in to the database" do
        expect { post :create, deal: attributes_for(:invalid_deal)}.not_to change(Deal, :count)
      end

      xit "redirects to the new deal path" do
        post :create, deal: attributes_for(:invalid_deal)
        expect(response).to redirect_to new_deal_path
      end
    end
  end

  describe "GET #edit" do
    it "should assign the correct deal to @deal" do
      get :edit, id: @deal
      expect(assigns(:deal)).to eq @deal
    end

    it "renders the :edit template" do
      get :edit, id: @deal
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    context "valid attributes" do
      xit "locates the requested @deal" do
        put :update, id: @deal, deal: attributes_for(:deal)
        expect(assigns(:deal)).to eq @deal
      end

      xit "changes the deal's attributes" do
        put :update, id: @deal, deal: attributes_for(:deal, item_price: 2.00, item_quantity: 10)
        @deal.reload
        expect(@deal.item_price).to eq 2.00
        expect(@deal.item_quantity).to eq 10
      end
    end
  end

  describe "get SHOW" do
    it "renders the show template" do
      get :show, id: @deal
      expect(response).to render_template :show
    end

    it "assigns the requested deal to @deal" do
      get :show, id: @deal
      expect(assigns(:deal)).to eq @deal
    end
  end

  describe "Delete #destroy" do
    it "deletes the deal" do
      expect {delete :destroy, id: @deal}.to change(Deal, :count).by(-1)
    end

    it "redirects to current vendor" do
      delete :destroy, id: @deal
      expect(response).to redirect_to vendor_path(@vendor)
    end
  end

end

