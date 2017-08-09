require "rails_helper"

RSpec.describe "static_pages/help" do
	it "test help page" do
	    render
	    expect(rendered).to include("help")
	end
end
