class DropTablePhoto < ActiveRecord::Migration
  def up
    drop_table :photos
  end

  def down
  end
end
