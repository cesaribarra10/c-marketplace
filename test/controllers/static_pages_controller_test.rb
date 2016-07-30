require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  #checks the path, and checks the title of each page
  test "should get home" do
    get root_path
    assert_response :success
    assert_select 'title', 'Marketplace'
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select 'title', 'Help | Marketplace'
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select 'title', 'About | Marketplace'
  end
end
