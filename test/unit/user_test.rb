require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should require all fields" do
     u1=User.new("Unity_ID" => "vsinghvs", "Name" =>"vartika", "Role" => "Student", "Password" => "singhvs")
     assert(u1.valid?)
   end

   test "Unity ID should be unique" do
    u1 = User.new("Unity_ID" => "vartikavs", "Name" =>"vartika", "Role" => "Student", "Password" => "singhvs")
    assert u1.save, "Should save u1 as unique"

    u2 = User.new("Unity_ID" => "vartikavs", "Name" =>"vartika", "Role" => "Student", "Password" => "singhvs")
    assert !u2.valid?, "Shouldn't be valid"
    assert !u2.save, "Shouldn't save u2 as unique"
  end

  test "password should be minimum 5" do
    u3 = User.new("Unity_ID" => "vsingh9vs", "Name" =>"vartika", "Role" => "Student", "Password" => "sing")
    assert(!u3.valid?)
  end

end