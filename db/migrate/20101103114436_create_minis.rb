class CreateMinis < ActiveRecord::Migration
  def self.up
    create_table :minis do |t|
      t.string :codigo
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :minis
  end
end
