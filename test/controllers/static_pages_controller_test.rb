require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    #staticpageのhomeのURLにアクセスする
    get root_path
    #成功します
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    #staticのhelpページにアクセスする
    get help_path
    #成功します
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "Help|Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    #staticpageのaboutページにgetでアクセスする
    get about_path
    #成功する
    assert_response :success
    #タイトルが下記になっていること
    assert_select "title", "About|Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
    #Contact PageにGetでアクセスする
    get contact_path
    #成功する
    assert_response :success
    #タイトルが下記のようになっている
    assert_select "title","Contact|Ruby on Rails Tutorial Sample App"
  end
end
