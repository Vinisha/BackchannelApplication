class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :Unity_ID, :references => [:users,:Unity_ID]
      t.string :Subject, :within=>5..10
      t.string :Content, :within=>0..30
      t.integer :Votes, :default=>0
      t.integer :No_Replies, :default=>0

      t.timestamps
    end
  end
end
