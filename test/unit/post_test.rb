require 'test_helper'

class PostTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

  test "should require all fields" do
     p4 = Post.new("Unity_ID"=>"", "Subject"=>"aababb","Content"=>"vartika singh", "Votes"=>5)
     assert(!p4.valid?)
     p5 = Post.new("Unity_ID"=>"vsingh3vs", "Subject"=>"aababb","Content"=>"", "Votes"=>5)
     assert(!p5.valid?)
     p6 = Post.new("Unity_ID"=>"vsingh3vs", "Subject"=>"","Content"=>"vartika singh", "Votes"=>5)
     assert(!p6.valid?)
   end

  test "should not save post without title" do
  post = Post.new
  assert !post.save
  end

  test "post subject's length should be within 5 and 10" do
    p = Post.new("Unity_ID"=>"vartikasingh", "Subject"=>"ab","Content"=>"vartikasinghools", "Votes"=>5)
    assert(!p.valid?)
    p1 = Post.new("Unity_ID"=>"vinishavarre", "Subject"=>"Hi How are you?","Content"=>"abcde", "Votes"=>5)
    assert(!p1.valid?)
  end

  test "post content's length should be within 0 and 30" do
    p3 = Post.new("Unity_ID"=>"vsinghvartika", "Subject"=>"abcde","Content"=>"SteveJobsco-foundedAppleinSiliconValley", "Votes"=>5)
    assert(!p3.valid?)
  end

end
