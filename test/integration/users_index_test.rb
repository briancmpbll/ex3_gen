require 'test_helper'

# Integration test for the users index.
class UsersIndexTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:user)
    99.times { FactoryGirl.create(:user) }
    Capybara.current_driver = :selenium
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
    User.paginate(page: 1).each do |user|
      assert has_link? user.name, href: user_path(user)
    end
  end

  test 'index as admin' do
    log_in_as @admin_user
    visit users_path
    User.paginate(page: 1).each do |user|
      if user == @admin_user
        assert has_no_link? 'delete', href: user_path(user)
      else
        assert has_link? 'delete', href: user_path(user)
      end
    end
    accept_alert 'Are you sure?' do
      click_link 'delete', href: user_path(@user)
    end
  end
end
