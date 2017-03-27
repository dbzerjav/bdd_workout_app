require "rails_helper"

RSpec.feature "Sending a message" do
    before do
    @bob = User.create!( first_name: "Bob",
                            last_name: "Smith",
                            email: "bob@example.com",
                            password: "password")
                            
    @john = User.create!(first_name: "John", 
                        last_name: "Doe", 
                        email: "john@example.com", 
                        password: "password" )
                        
    @jim = User.create!( first_name: "Jim", 
                        last_name: "Doe", 
                        email: "jim@example.com", 
                        password: "password" )
    
    @room_name = @john.first_name + "-" + @john.last_name
    @room = Room.create!(name: @room_name, user_id: @john.id)
    
    login_as(@john)
    
    Friendship.create(user: @bob, friend: @john)
    Friendship.create(user: @jim, friend: @john)
  end
  
  scenario "to followers show chatroom window" do
    visit "/"
    
    click_link "My Lounge"
    expect(page).to have_content(@room_name)
    
    fill_in "message-field", with: "Hello"
    click_button "Post"
    
    within("#followers") do
      expect(page).to have_link(@bob.full_name)
      expect(page).to have_link(@jim.full_name)
    end
  end
  
end