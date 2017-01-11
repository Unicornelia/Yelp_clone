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


end