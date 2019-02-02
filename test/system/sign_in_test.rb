require_relative '../application_system_test_case'

class SignInTest < ApplicationSystemTestCase
  setup do
    @user = create :user
  end

  test 'signing in' do
    visit root_path
    click_link_or_button 'Zaloguj się'
    fill_in 'Adres e-mail', with: @user.email
    fill_in 'Hasło', with: @user.password
    click_link_or_button 'Log in'
    assert_text 'Zalogowano pomyślnie'
  end
end
