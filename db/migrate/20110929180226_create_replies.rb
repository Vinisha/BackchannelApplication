class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :Post_ID, :references => [:posts,:id]
      t.integer :Reply_number, :default=>0
      t.string :Unity_ID, :references => [:users,:Unity_ID]
      t.string :Subject, :references =>[:posts,:Subject]
      t.string :Reply, :limit=>1096
      t.integer :No_of_likes, :default=>0
      t.timestamps
    end
  end
end
