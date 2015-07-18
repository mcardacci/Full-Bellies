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
      @vendor = create(:vendor)
      session[:vendor_id] = @vendor.id
    end

    context "with valid attributes" do
      it "saves the new deal into the database" do
        expect{ post :create, deal: attributes_for(:deal, vendor_id: @vendor.id)}.to change(Deal, :count).by(1)
      end

      it "redirects to the current vendor's profile page" do
        post :create, deal: attributes_for(:deal, vendor_id: @vendor.id)
        expect(response).to redirect_to vendor_path(@vendor)
      end
    end

    context "with invalid attributes" do
      it "does not save the deal in to the database" do
        expect { post :create, deal: attributes_for(:invalid_deal)}.not_to change(Deal, :count)
      end

      it "redirects to the new deal path" do
        post :create, deal: attributes_for(:invalid_deal)
        expect(response).to redirect_to new_deal_path
      end
    end
  end

end

