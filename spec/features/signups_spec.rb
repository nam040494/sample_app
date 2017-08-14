require "rails_helper"

RSpec.feature "Signups", type: :feature do
  scenario "User creates" do
    visit "/signup"
    name = "Nam Nguyen"
    email = "abcd@example.com"
    fill_in "user_name", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Create my account"
    expect(page).to have_text("Welcome to the Sample App!")
  end

  scenario "valid password" do
    visit "/signup"
    name = "Nam Nguyen"
    email = "abcd@example.com"
    fill_in "user_name", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password12345"
    click_button "Create my account"
    expect(page).to have_text("Password confirmation doesn't match Password")
  end

  scenario "valid password is too short" do
    visit "/signup"
    name = "Nam Nguyen"
    email = "abcd@example.com"
    fill_in "user_name", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "1234"
    fill_in "user_password_confirmation", :with => "1234"
    click_button "Create my account"
    expect(page).to have_text("Password is too short (minimum is 6 characters)")
  end

  scenario "valid email" do
    visit "/signup"
    name = "Nam Nguyen"
    email = "abcd@example"
    fill_in "user_name", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Create my account"
    expect(page).to have_text("Email is invalid")
  end

  scenario "valid user" do
    visit "/signup"
    name = ""
    email = ""
    fill_in "user_name", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => ""
    fill_in "user_password_confirmation", :with => ""
    click_button "Create my account"
    expect(page).to have_text("Name can't be blank")
    expect(page).to have_text("Email can't be blank")
    expect(page).to have_text("Email is invalid")
    expect(page).to have_text("Password can't be blank")
    expect(page).to have_text("Password can't be blank")
    expect(page).to have_text("Password is too short (minimum is 6 characters)")
  end
end
