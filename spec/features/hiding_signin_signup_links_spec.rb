require "rails_helper"

RSpec.feature "Hiding signin and signout links when approiate" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password" )
  end
  
  scenario "while signed in" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
    
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
    expect(page).to have_content("Sign out")
  end
  
  scenario "while not signed in" do
    visit "/"
    
    expect(page).to have_link("Sign in")
    expect(page).to have_link("Sign up")
    expect(page).not_to have_link("Sign out")
  end
end