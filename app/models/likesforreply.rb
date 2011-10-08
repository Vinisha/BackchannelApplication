class Likesforreply < ActiveRecord::Base
  belongs_to :reply
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :reply_id, :scope=>[:post_id,:liked_by]
end
