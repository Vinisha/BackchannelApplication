class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :Unity_ID, :references => [:users,:Unity_ID]
      t.integer :Post_ID, :references => [:posts,:id]
      t.timestamps
    end
  end
end
