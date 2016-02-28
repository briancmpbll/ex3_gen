require 'test_helper'

# Integration test for editing users
class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryGirl.create(:user)
  end

  test 'unsuccessful edit' do
    visit edit_user_path @user
    fill_in 'Display name', with: ''
    fill_in 'Email', with: ''
    click_button 'Save changes'
    assert_text 'Update your profile'
    assert_selector '#error_explanation'
  end

  test 'successful edit' do
    name = 'new name'
    email = 'new@email.com'

    visit edit_user_path @user
    fill_in 'Display name', with: name
    fill_in 'Email', with: email
    click_button 'Save changes'
    assert_no_text 'Update your profile'
    assert_selector 'div.alert-success'
  end
end
