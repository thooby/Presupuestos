class CreateAsientos < ActiveRecord::Migration
  def self.up
    create_table :asientos do |t|
      t.integer :dep_id
      t.integer :cap_code
      t.string :desc
      t.float :cantidad
      t.integer :mini_id
      t.integer :prog_id

      t.timestamps
    end
  end

  def self.down
    drop_table :asientos
  end
end
