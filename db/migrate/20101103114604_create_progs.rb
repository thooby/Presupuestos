class CreateProgs < ActiveRecord::Migration
  def self.up
    create_table :progs do |t|
      t.string :codigo
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :progs
  end
end
