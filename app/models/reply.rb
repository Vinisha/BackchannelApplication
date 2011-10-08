class Reply < ActiveRecord::Base
    belongs_to :Post
    #has_many :Likesforreply

    validates :Reply, :presence=>true
    validates :Reply_number, :presence=>true

end
