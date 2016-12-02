class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0

      t.timestamps
    end
  end
end
