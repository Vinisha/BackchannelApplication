class Like < ActiveRecord::Base
  belongs_to :User
  belongs_to :Post

  validates_uniqueness_of :Post_ID, :scope=>:Unity_ID
end
