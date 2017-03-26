require "rails_helper"

RSpec.feature "" do
   before do
    @john = User.create(first_name: "John", 
                        last_name: "Doe", 
                        email: "john@example.com", 
                        password: "password" )
    
    @jim = User.create(first_name: "Jim", 
                       last_name: "Bee", 
                       email: "jim@example.com", 
                       password: "password" )
    
    login_as(@john)
    
    @following = Friendship.create(user: @john, friend: @jim)
  end
  
  scenario do
    visit "/"
    
    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click
    
    expect(page).to have_content(@jim.full_name + " unfollowed")
  end
  
end
