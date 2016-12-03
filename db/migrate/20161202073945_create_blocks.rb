class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :name, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0
      t.integer :include_type, :null => false, :default => 0
      t.integer :content_type, :null => false, :default => 0
      t.references :block_field, foreign_key: true, :default => 0
      t.references :block_group, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
