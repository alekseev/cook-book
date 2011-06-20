class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :title
      t.text :recipe
      t.integer :category_id
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
