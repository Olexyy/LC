class CreateBlockGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :block_groups do |t|
      t.string :name, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0

      t.timestamps
    end
  end
end
