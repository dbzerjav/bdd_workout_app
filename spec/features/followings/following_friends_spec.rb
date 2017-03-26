require "rails_helper"

RSpec.feature "Follwoing friends" do
  before do
    @john = User.create(first_name: "John", 
                        last_name: "Doe", 
                        email: "john@example.com", 
                        password: "password" )
                        
    @jim = User.create( first_name: "Jim", 
                        last_name: "Doe", 
                        email: "jim@example.com", 
                        password: "password" )
    login_as(@john)
    
  end
    
    scenario "if signed in" do
      visit "/"
      
      expect(page).to have_content(@john.full_name)
      expect(page).to have_content(@jim.full_name)
      
      href = "/friendships?friend_id=#{@john.id}"
      expect(page).not_to have_link("Follow", :href => href)
      
      link = "a[href='/friendships?friend_id=#{@jim.id}']"
      find(link).click
      
      href = "/friendships?friend_id=#{@jim.id}"
      expect(page).not_to have_link("Follow")
    end
  
end