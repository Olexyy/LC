class CreateBlockSubgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :block_subgroups do |t|
      t.string :name
      t.integer :weight
      t.references :block_group, foreign_key: true

      t.timestamps
    end
  end
end
