class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.column :name, :string, :limit => 50, :null => false
      t.column :category_id, :integer
      t.column :weight, :integer, :null => false, :default => 0
    end
  end
end
