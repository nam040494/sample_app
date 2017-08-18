require "rails_helper"

RSpec.describe SessionsController, type: :controller do

  describe "GET #login" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    context "index title login" do
      render_views
      before do
        get :new
      end
      it{expect(response).to render_template :new}
      it{expect(response.body).to have_title("Login | Ruby on Rails Tutorial Sample App")}
    end
  end

  describe "GET #logout" do
    it "returns logout page" do
      get :destroy
      expect(response).to redirect_to(root_url)
    end
  end

  describe "POST #create" do
    subject {response}
    before do
      post :create, params: {session: {email: "", password: ""}}
      it {is_expected.to render_template :new}
      it {expect(subject.body).to have_selector "div", class: "alert alert-danger"}
    end
  end
end
