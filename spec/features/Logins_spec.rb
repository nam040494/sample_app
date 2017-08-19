require "rails_helper"

RSpec.feature "Logins", type: :feature do
  scenario "login failse" do
    visit "/login"
    click_button "Log in"
    expect(page).to have_text("Invalid email/password combination")
  end

  scenario "login success" do
    @user = User.new name: "Nam Nguyen", email: "abc@def.vn", password: "abc123"
    @user.save

    visit "/login"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
    expect(page).to have_text("Nam Nguyen")
  end
end
