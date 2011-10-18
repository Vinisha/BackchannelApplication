require 'test_helper'

#class MyTest < Test::Unit::TestCase
 class MyTest < ActionController::IntegrationTest

  fixtures:all

  test "view posts from login page" do
  visit("/logins/new")
  assert current_path == "/logins/new"
  u=User.new("Unity_ID" => "vsingh3", "Name" =>"vartika", "Role" => "Student", "Password" => "vartika")
  find_field("Username").set('vsingh3')
  find_field("Password").set('vartika')
  click_link_or_button("Login")
  assert current_path == "/logins/new"
  #assert current_path == "/posts/index"
  end

  test "go to new user page" do
    visit("/logins/new")
    click_link("New user?")
    assert (current_path == "/users/new")
  end

end
