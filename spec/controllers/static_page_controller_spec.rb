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
	describe "static_pages/help" do
		it "test controller help" do
			get :help
			expect(response.status).to eq(200)
		end
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

