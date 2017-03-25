require "rails_helper"

RSpec.feature "Searching for User" do
  
  before do
    
    @john = User.create!(first_name: "John", 
                        last_name: "Doe", 
                        email: "john@example.com", 
                        password: "password" )
                        
    @jim = User.create!(first_name: "Jim", 
                        last_name: "Doe", 
                        email: "jim@example.com", 
                        password: "password" )
  end
  
  scenario "with existing name returns all users with that name" do
    visit "/"
    
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jim.full_name)
    expect(current_path).to eq("/dashboards/search")
  end
  
end