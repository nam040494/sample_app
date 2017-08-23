require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do

    before(:each) do
      @user = FactoryGirl.create :user
    end

    describe "as a non-signed-in user" do
      it "" do
        delete :destroy, :id => @user
        response.should redirect_to(login_path)
      end
    end

    describe "as non-admin user" do
      it "" do
        test_sign_in(@user)
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end
  end

  describe "PUT #update" do

    before(:each) do
      @user = FactoryGirl.create :user
      test_sign_in(@user)
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New Name", :email => "user@example.org",
                  :password => "abc123", :password_confirmation => "abc123" }
      end

      it "should change the user's attributes" do
        put :update, :id => @user, :user => @attr
        @user.reload
        expect(@user.email).to eq "user@example.org"
      end
    end
  end
end
