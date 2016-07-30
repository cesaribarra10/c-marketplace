require 'test_helper'

class HomeLayoutTest < ActionDispatch::IntegrationTest
  # Makes sure that the home page loads the right templates and routes
  test 'Layout Links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', help_path
  end
end
