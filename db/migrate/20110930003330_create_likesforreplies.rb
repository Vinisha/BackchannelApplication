class CreateLikesforreplies < ActiveRecord::Migration
  def change
    create_table :likesforreplies do |t|
      t.integer :post_id, :references=> [:replies,:Post_ID]
      t.integer :reply_id, :references=> [:replies, :id]
      t.string :liked_by, :references => [:users,:Unity_ID]
      t.timestamps

    end
  end
end
