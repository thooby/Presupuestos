class CreateComparas < ActiveRecord::Migration
  def self.up
    create_table :comparas do |t|
      t.integer :asiento_id
      t.integer :orden

      t.timestamps
    end
  end

  def self.down
    drop_table :comparas
  end
end
