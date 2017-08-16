require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    context "index title home" do
      render_views
      before do
        get :home
      end
      it{expect(response).to render_template :home}
      it{expect(response.body).to have_title("Home | Ruby on Rails Tutorial Sample App")}
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    context "index title help" do
      render_views
      before do
        get :help
      end
      it{expect(response).to render_template :help}
      it{expect(response.body).to have_title("Help | Ruby on Rails Tutorial Sample App")}
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    context "index title about" do
      render_views
      before do
        get :about
      end
      it{expect(response).to render_template :about}
      it{expect(response.body).to have_title("About | Ruby on Rails Tutorial Sample App")}
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    context "index title about" do
      render_views
      before do
        get :contact
      end
      it{expect(response).to render_template :contact}
      it{expect(response.body).to have_title("Contact | Ruby on Rails Tutorial Sample App")}
    end
  end
end
