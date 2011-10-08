class Post < ActiveRecord::Base
  belongs_to :User
  has_many :Reply


   validates_length_of :Subject, :within => 5..10
   validates_length_of :Content, :within => 0..30
   validates :Unity_ID, :presence=>true
   validates :Subject, :presence=>true
   validates :Content, :presence=>true


end
