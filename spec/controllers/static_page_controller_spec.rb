require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages/home" do
	it "test controller home" do
	  get :home
	  expect(response.status).to eq(200)
	end
  end
end

RSpec.describe StaticPagesController, type: :controller do
  context "index title home" do
  render_views
    before do
      get :show, params: {page: :home}
    end
    it{expect(response).to render_template :home}
    it{expect(response.body).to have_title("Home | Ruby on Rails Tutorial Sample App")}
  end
end

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages/help" do
	it "test controller help" do
	  get :help
	  expect(response.status).to eq(200)
	end
  end
end

RSpec.describe StaticPagesController, type: :controller do
  context "index title help" do
  render_views
    before do
      get :show, params: {page: :help}
    end
    it{expect(response).to render_template :help}
    it{expect(response.body).to have_title("Help | Ruby on Rails Tutorial Sample App")}
  end
end

RSpec.describe StaticPagesController, type: :controller do
	describe "static_pages/about" do
		it "test controller about" do
			get :about
			expect(response.status).to eq(200)
		end
	end
end

RSpec.describe StaticPagesController, type: :controller do
  context "index title about" do
  render_views
    before do
      get :show, params: {page: :about}
    end
    it{expect(response).to render_template :about}
    it{expect(response.body).to have_title("About | Ruby on Rails Tutorial Sample App")}
  end
end
