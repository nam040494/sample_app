require "rails_helper"

RSpec.describe "UsersSignups", type: :request do
  describe "GET /login" do
    it "works! (now write some real specs)" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    let :user {FactoryGirl.create :user}

      context "Sessions User" do
        it "user login" do
          get login_path
          post login_path, params: {sessions: {email: user.email, password: user.password}}
          expect(response).to redirect_to root_path
          follow_redirect!
          expect(response).to render_template "/"
          expect(response.body).to include logout_path
          expect(response.body).not_to include login_path
        end
        it "user logout" do
          delete logout_path
          expect(response).to redirect_to root_path
          follow_redirect!
          expect(response).to render_template "/"
          expect(response.body).to include login_path
          expect(response.body).not_to include logout_path
        end
      end

      context "login with remembering" do
        before do
          post login_path, params: {sessions: {email: user.email, password: user.password, remember_me: "1"}}
        end
        it {expect(response.cookies["remember_token"]).not_to eq nil}
      end

      context "login without remembering" do
        before do
          post login_path, params: {sessions: {email: user.email, password: user.password, remember_me: "1"}}
          post login_path, params: {sessions: {email: user.email, password: user.password, remember_me: "0"}}
        end
        it {expect(response.cookies["remember_token"]).to eq nil}
      end
  end
end
