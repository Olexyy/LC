class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name, :limit => 150, :null => false
      t.references :category, foreign_key: true
      t.integer :weight, :null => false, :default => 0

      t.timestamps
    end
  end
end
