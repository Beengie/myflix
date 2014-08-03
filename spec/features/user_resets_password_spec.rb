require 'spec_helper'

feature "user resets password" do
  scenario "user successfully resets the password" do
    lalaine = Fabricate(:user, password: 'old_password')
    visit sign_in_path
    click_link "Forgot Password?"
    fill_in "Email Address", with: lalaine.email
    click_button "Send Email"

    open_email(lalaine.email)
    current_email.click_link("Reset My Password")

    fill_in "New Password", with: "new_password"
    click_button "Reset Password"

    fill_in "Email Address", with: lalaine.email
    fill_in "Password", with: "new_password"
    click_button "Sign in"
    expect(page).to have_content("Welcome, #{lalaine.username}")

    clear_email
  end
end