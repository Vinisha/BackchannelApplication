class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Unity_ID, :unique=>true
      t.string :Name, :presence=>true
      t.string :Password, :presence=>true, :minimum=>6
      t.string :Role, :presence=>true

      t.timestamps
    end
  end
end
