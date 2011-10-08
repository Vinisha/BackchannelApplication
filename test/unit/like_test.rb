require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test "user shouldn't be able to like his own post" do
       l1 = Like.new("Unity_ID"=>"vsingh3", "Post_ID"=>"3")
       assert l1.save
       l2 = Like.new("Unity_ID"=>"vsingh3", "Post_ID"=>"3")
       assert !l2.save
       l3 = Like.new("Unity_ID"=>"vsingh3", "Post_ID"=>"4")
       assert l3.save
  end
end
