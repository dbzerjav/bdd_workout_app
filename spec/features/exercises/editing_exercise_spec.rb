require "rails_helper"

RSpec.feature "Editing an exercise" do
  
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password" )
    
    @john_exercise = @john.exercises.create!(duration_in_min: 27,
                                  workout: "My body building activity",
                                  workout_date: Date.today)
    login_as(@john)
  end
  
  scenario "with valid data succeeds" do
    visit "/"
    
    click_link "My Lounge"
    
    path = "/users/#{@john.id}/exercises/#{@john_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click 
    
    fill_in "Duration", with: 70
    click_button "Update Exercise"
    
    
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(70)
    expect(page).not_to have_content(27)
    
  end
  
    scenario "A user fails to update an article" do
    visit "/"
    
    click_link "My Lounge"
    
    path = "/users/#{@john.id}/exercises/#{@john_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click
    
    fill_in "Duration", with: ""
    click_button "Update Exercise"
    
    expect(page).to have_content("Exercise has not been updated")

  end
  
end