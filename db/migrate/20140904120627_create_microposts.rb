class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :user_id, null: false
      t.string :content
      t.timestamps
    end
  end
end
