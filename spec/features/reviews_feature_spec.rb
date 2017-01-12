require 'rails_helper'

RSpec.feature 'reviewing', :type => :feature  do
  include WebHelpers

  scenario 'allows users to leave a review using a form' do
    sign_up
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
    sign_up
    create_restaurant
    sign_out
    click_link 'Review KFC'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end
