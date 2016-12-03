class CreateWebResources < ActiveRecord::Migration[5.0]
  def change
    create_table :web_resources do |t|
      t.string :name, :limit => 150, :null => false
      t.string :title, :limit => 150
      t.text :body, :null => false
      t.string :key, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0

      t.timestamps
    end
  end
end
