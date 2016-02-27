require 'test_helper'

# Integration test for signing in a user.
class UsersLoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryGirl.create(:user)
  end

  test 'login with invalid information' do
    visit login_path
    assert has_link? 'Log in', href: login_path
    click_button 'Log in'
    assert_current_path login_path
    assert_selector 'div.alert-danger'
    assert_text 'Invalid email/password combination'
    assert_not logged_in_menu? @user
    visit root_path
    assert_no_selector 'div.alert'
  end

  test 'login with a valid user followed by logout' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    assert_current_path user_path(@user)
    assert logged_in_menu? @user
    assert_no_selector 'div.alert-danger'
    assert_selector 'div.alert-notice'
    assert_text 'Welcome back!'
    click_link 'Log out'
    assert_current_path root_path
    assert_not logged_in_menu? @user
  end
end
