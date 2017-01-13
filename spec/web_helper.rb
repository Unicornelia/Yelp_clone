module WebHelpers

  def sign_up(user)
    visit '/'
    click_link "Sign up"
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    fill_in 'user_password_confirmation', with: user[:password]
    click_button 'Sign up'
  end

  def sign_in(user)
    visit '/'
    click_link "Sign in"
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    click_button 'Log in'
  end

  def create_restaurant
    visit '/'
    click_link 'Add a restaurant'
    fill_in 'restaurant[name]', with: 'KFC'
    fill_in 'restaurant[description]', with: 'Deep fried goodness'
    click_button 'Create Restaurant'
  end

  def create_another_restaurant
    visit '/'
    click_link 'Add a restaurant'
    fill_in 'restaurant[name]', with: "Moe's Tavern"
    fill_in 'restaurant[description]', with: 'Cosy place'
    click_button 'Create Restaurant'
  end

  def review_restaurant(review)
    click_link 'Review KFC'
    fill_in "Thoughts", with: review[:thoughts]
    select review[:rating], from: 'Rating'
    click_button 'Leave Review'
  end

  def sign_out
    click_link "Sign out"
  end

end
