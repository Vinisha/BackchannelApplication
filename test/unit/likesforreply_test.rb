require 'test_helper'

class LikesforreplyTest < ActiveSupport::TestCase
  test "User shouldn't be able to like his own reply" do
     lr1 = Likesforreply.new("post_id"=>"3", "reply_id"=>"4", "liked_by"=>"vsingh3")
     assert lr1.save
     lr2 = Likesforreply.new("post_id"=>"3", "reply_id"=>"4", "liked_by"=>"vsingh3")
     assert !lr2.save
     lr3 = Likesforreply.new("post_id"=>"3", "reply_id"=>"5", "liked_by"=>"vsingh3")
     assert lr3.save
  end
end
