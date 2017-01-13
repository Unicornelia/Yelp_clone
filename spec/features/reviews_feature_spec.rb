require 'rails_helper'

RSpec.feature 'reviewing', :type => :feature  do
  include WebHelpers
  user1 = {email: 'test@email.com', password: 'notpassword'}
  user2 = {email: 'new@email.com', password: 'password'}
  review1 = { thoughts: "so so", rating: "3" }
  review2 = { thoughts: "bleh", rating: "1" }

  scenario 'allows users to leave a review using a form' do
    sign_up(user1)
    create_restaurant
    review_restaurant(review1)
    expect(current_path).to eq "/restaurants"
    click_link 'KFC'
    expect(page).to have_content('so so')
  end

  scenario 'user can\'t add a review without signing up' do
    sign_up(user1)
    create_restaurant
    sign_out
    click_link 'Review KFC'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  context 'deleting reviews' do
    scenario 'user can delete their own review' do
      sign_up(user1)
      create_restaurant
      review_restaurant(review1)
      click_link 'KFC'
      click_link 'Delete review'
      expect(page).not_to have_content 'so so'
    end

    scenario 'user can not delete other user\'s reviews' do
      sign_up(user1)
      create_restaurant
      review_restaurant(review1)
      sign_out
      sign_up(user2)
      click_link 'KFC'
      expect(page).not_to have_content 'Delete review'
    end
  end

  context "average rating" do
    scenario "displays an average rating for all reviews" do
      sign_up(user1)
      create_restaurant
      review_restaurant(review1)
      sign_out
      sign_up(user2)
      review_restaurant(review2)
      expect(page).to have_content("Average Rating: 2")
    end
  end

end
