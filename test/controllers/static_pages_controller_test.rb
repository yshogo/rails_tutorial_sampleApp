require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    #staticpageのhomeのURLにアクセスする
    get static_pages_home_url
    #成功します
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    #staticのhelpページにアクセスする
    get static_pages_help_url
    #成功します
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "Help|Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    #staticpageのaboutページにgetでアクセスする
    get static_pages_about_url
    #成功する
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "About|Ruby on Rails Tutorial Sample App"
  end
end
