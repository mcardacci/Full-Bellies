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

