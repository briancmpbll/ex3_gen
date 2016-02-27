require 'test_helper'

# Integration test for signing up a new user.
class UsersSignupTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryGirl.build(:user)
  end

  test 'signing up with invalid information' do
    visit signup_path
    assert_no_difference('User.count') do
      click_button 'Create my account'
    end
    assert_not logged_in_menu? @user
    assert_current_path users_path
    assert_selector 'div#error_explanation'
  end

  test 'signing up with valid information' do
    visit signup_path
    assert_difference('User.count', 1) do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirmation', with: @user.password_confirmation
      click_button 'Create my account'
    end
    assert_current_path user_path(User.order('created_at').last)
    assert_no_selector 'div#error_explanation'
    assert logged_in_menu? @user
  end
end
