require "rails_helper"


RSpec.describe "static_pages/about" do
	it "about" do
	    render
	    expect(rendered).to include("About")
	end
end
