require 'rails_helper'

describe UserController do
  # describe 'user access' do
  #   before :each do
  #     @user = create(:user)
  #     session[:user_id] = @user.id
  #   end

    describe 'GET #new' do
      it "assigns a new user to @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context "with valid attributes" do
        it "saves the new user in the database" do
          expect{ post :create, user: attributes_for(:user)}.to change(User, :count).by(1)
        end

        ### uncomment when pull changes
        it "redirects to user#show" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to user_path(assigns[:user])
        end

        it "logs in user and sets session[user_id]" do
          post :create, user: attributes_for(:user)
          expect(session[:user_id]).to be_truthy
        end
      end

      context "with invalid attributes" do
        it "does not save the user in the database" do
          expect{ post :create, user: attributes_for(:invalid_user)}.not_to change(User, :count)
        end
      end
    end
  end
