class CreateLawsuits < ActiveRecord::Migration[5.0]
  def change
    create_table :lawsuits do |t|
      t.string :name, limit: 150, null: false
      t.integer :weight, null: false, default: 0
      t.references :subcategory, foreign_key: true, null: false
      t.references :web_resource, foreign_key: true, null: true, default: nil

      t.timestamps
    end
  end
end
