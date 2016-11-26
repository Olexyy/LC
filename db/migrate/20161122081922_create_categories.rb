class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.column :name, :string, :limit => 50, :null => false
      t.column :weight, :integer, :null => false, :default => 0
    end
  end
end
