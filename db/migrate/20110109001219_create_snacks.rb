class CreateSnacks < ActiveRecord::Migration
  def self.up
    create_table :snacks do |t|
      t.string :name
      t.string :category
      t.decimal :price, :precision => 2
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :snacks
  end
end
