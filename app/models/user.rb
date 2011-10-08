class User < ActiveRecord::Base
  has_many :Posts

  validates_uniqueness_of :Unity_ID
  validates_presence_of :Name, :Role
  validates_length_of :Password, :minimum => 6
  validates :Unity_ID, :presence=>true
  validates :Name, :presence=>true
  validates :Role, :presence=>true
  validates :Password, :presence=>true
end
