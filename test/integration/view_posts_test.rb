require 'test_helper'

class MyTest < Test::Unit::TestCase

  test "view posts from login page" do
  visit("/logins/new")
  click_link("Login")
  puts page.body

  fill_in (:user, :with => "vsinghvar")
  fill_in (:pass, :with => "vartikavar")
  puts page.body
  click_button("Login")
  end

  test "go to new user page" do
    visit("users_path")
    click_link("New user?")
    assert (current_path == "/users/new")
  end

end