require 'test_helper'

# Integration test for editing users
class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryGirl.create(:user)
  end

  test 'unsuccessful edit' do
    log_in_as @user
    visit edit_user_path @user
    fill_in 'Display name', with: ''
    fill_in 'Email', with: ''
    click_button 'Save changes'
    assert_text 'Update your profile'
    assert_selector '#error_explanation'
  end

  test 'successful edit with friendly forwarding' do
    visit edit_user_path @user
    assert_current_path login_path
    assert_selector '.alert-danger'
    log_in_as @user
    assert_current_path edit_user_path(@user)
    fill_in 'Display name', with: 'new name'
    fill_in 'Email', with: 'new@email.com'
    click_button 'Save changes'
    assert_no_text 'Update your profile'
    assert_selector 'div.alert-success'
  end
end
