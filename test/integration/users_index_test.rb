require 'test_helper'

# Integration test for the users index.
class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryGirl.create(:user)
    99.times { FactoryGirl.create(:user) }
  end

  test 'index including pagination' do
    visit users_path
    assert_current_path login_path
    assert_selector '.alert-danger'
    log_in_as @user
    assert_current_path users_path
    assert_selector 'ul.pagination'
    User.paginate(page: 1).each do |user|
      assert has_link? user.name, href: user_path(user)
    end
  end
end
