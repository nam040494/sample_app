require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  context "index title home" do
    render_views
    before do
      get :show, params: {page: :home}
    end
    it{expect(response).to render_template :home}
    it{expect(response.body).to have_title("Home | Ruby on Rails Tutorial Sample App")}
  end

  context "index title help" do
    render_views
    before do
      get :show, params: {page: :help}
    end
    it{expect(response).to render_template :help}
    it{expect(response.body).to have_title("Help | Ruby on Rails Tutorial Sample App")}
  end

  context "index title about" do
    render_views
    before do
      get :show, params: {page: :about}
    end
    it{expect(response).to render_template :about}
    it{expect(response.body).to have_title("About | Ruby on Rails Tutorial Sample App")}
  end
end
