require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "reply shouldn't be blank" do
      r = Reply.new("Post_ID"=>"2", "Reply_number"=>"3", "Unity_ID"=>"vsingh3", "Subject"=>"hellohi", "Reply"=>"", "No_of_likes"=>3)
      assert(!r.valid?)
  end

  test "reply number should be present" do
      r = Reply.new("Post_ID"=>"2", "Reply_number"=>"", "Unity_ID"=>"vsingh3", "Subject"=>"hellohi", "Reply"=>"hiiiiiii", "No_of_likes"=>3)
      assert(!r.valid?)
  end
end
