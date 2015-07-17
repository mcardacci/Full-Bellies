require 'rails_helper'

describe UserController do
  describe 'user access' do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
    end

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

        it "re-directs to new user signup" do
          post :create, user:attributes_for(:invalid_user)
          expect(response).to redirect_to new_user_path
        end
      end
    end

    describe 'GET #show' do
      it "renders the :show template" do
        user = create(:user)
        get :show, id: user
        expect(response).to render_template :show
      end

      it "assigns the requested user to @user" do
        user = create(:user)
        get :show, id: user
        expect(assigns(:user)).to eq user
      end
    end

    describe 'GET #edit' do
      it "assigns the requested user to @user" do
        user = create(:user)
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :edit template" do
        user = create(:user)
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end

    describe 'PUT #update' do
      before :each do
        @user = create(:user, email: "bob@example.com", username: "bob")
      end

      context "valid attributes" do
        it "locates the requested @user" do
          put :update, id: @user, user: attributes_for(:user)
          expect(assigns(:user)).to eq @user
        end

        it "changes the contact's attributes" do
          put :update, id: @user, user: attributes_for(:user, email: "larry@example.com", username: "larry")
          @user.reload
          expect(@user.email).to eq "larry@example.com"
          expect(@user.username).to eq "larry"
        end

        it "redirects to the updated user" do
          put :update, id: @user, user: attributes_for(:user)
          expect(response).to redirect_to @user
        end
      end

      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @user, user: attributes_for(:invalid_user)
          expect(assigns(:user)).to eq @user
        end

        it "does not change the contact's attributes" do
          put :update, id: @user, user: attributes_for(:user, username: "Larry", email: nil)
          @user.reload
          expect(@user.username).not_to eq("Larry")
          expect(@user.email).to eq("bob@example.com")
        end

        it "re-renders the edit method" do
          put :update, id: @user, user: attributes_for(:invalid_user)
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @user = create(:user)
      end

      it "deletes the user" do
        expect{delete :destroy, id: @user}.to change(User, :count).by(-1)
      end

      it "redirects to root path" do
        delete :destroy, id: @user
        expect(response).to redirect_to root_path
      end
    end
  end
end
