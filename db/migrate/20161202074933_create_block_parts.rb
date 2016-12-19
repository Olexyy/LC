class CreateBlockParts < ActiveRecord::Migration[5.0]
  def change
    create_table :block_parts do |t|
      t.string :name, :limit => 150, :null => false
      t.text :text, :null => false
      t.integer :weight, :null => false, :default => 0
      t.references :block, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
