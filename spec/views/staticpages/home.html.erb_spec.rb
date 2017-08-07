require "rails_helper"

RSpec.describe "static_pages/home" do
  	it "test home page" do
    	render
   		expect(rendered).to (include "home")
	
    end
end


