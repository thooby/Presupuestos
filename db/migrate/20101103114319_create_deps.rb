class CreateDeps < ActiveRecord::Migration
  def self.up
    create_table :deps do |t|
      t.string :codigo
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :deps
  end
end
