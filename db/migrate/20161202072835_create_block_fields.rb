class CreateBlockFields < ActiveRecord::Migration[5.0]
  def change
    create_table :block_fields do |t|
      t.string :name, :limit => 150, :null => false
      t.string :text, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0
      t.integer :data_type, :null => false, :default => 0
      t.string :marker, :limit => 150, :null => true
      t.string :value, :limit => 150, :null => true

      t.timestamps
    end
  end
end
