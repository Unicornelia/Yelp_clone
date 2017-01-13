require 'rails_helper'

RSpec.feature 'reviewing', :type => :feature  do
  include WebHelpers
  user1 = {email: 'test@email.com', password: 'notpassword'}
  user2 = {email: 'new@email.com', password: 'password'}

  scenario 'allows users to leave a review using a form' do
    sign_up(user1)
    create_restaurant
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
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

    end

    scenario 'user can not delete other user\'s reviews' do
    end
  end

end
