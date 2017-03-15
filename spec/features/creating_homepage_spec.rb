require "rails_helper"

RSpec.feature "Creating homepage" do
  
  scenario "A user navigates to the homepage" do
    visit "/"
    
    expect(page).to have_link("Home")
    expect(page).to have_link("Athletes Den")
    expect(page).to have_content("Workout Lounge!")
    expect(page).to have_link("Show off your workout")
  end

end