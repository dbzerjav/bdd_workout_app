require "rails_helper"

RSpec.feature "Listing Members" do
  
  before do
    
    @john = User.create(first_name: "John", 
                        last_name: "Doe", 
                        email: "john@example.com", 
                        password: "password" )
    @jim = User.create(first_name: "Jim", 
                        last_name: "Bee", 
                        email: "jim@example.com", 
                        password: "password" )
  end
  
  scenario "shows a list of registered memebers" do
    visit "/"
    
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jim.full_name)
    
  end
end
  