require 'test_helper'

# Unit tests for the application controller.
class ApplicationHelperTest < ActionView::TestCase
  test 'full_title should return a concatenated title with input' do
    assert_equal "#{BASE_TITLE} | test", full_title('test')
  end

  test 'full_title should return a default title with no input' do
    assert_equal BASE_TITLE, full_title
  end
end
