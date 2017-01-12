module WebHelpers

  def sign_up
    visit '/'
    click_link "Sign up"
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  def sign_in
    visit '/'
    click_link "Sign in"
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
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

  def sign_out
    visit '/'
    click_link "Sign out"
  end

end
