require 'test_helper'

# Integration test for the users index.
class UsersIndexTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium
    @admin_user = FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:user)
    40.times { FactoryGirl.create(:user) }
  end

  teardown do
    Capybara.use_default_driver
  end

  test 'index including pagination' do
    visit users_path
    assert_current_path login_path
    assert_selector '.alert-danger'
    log_in_as @user
    assert_current_path users_path
    assert_selector 'ul.pagination'
    assert_no_text 'delete'
    assert has_link? user.name, href: user_path(@user)
    assert has_link? user.name, href: user_path(@admin_user)
  end

  test 'index as admin' do
    log_in_as @admin_user
    visit users_path
    assert has_link? 'delete', href: user_path(@user)
    assert has_no_link? 'delete', href: user_path(@admin_user)
    accept_alert 'Are you sure?' do
      click_link 'delete', href: user_path(@user)
    end
  end
end
