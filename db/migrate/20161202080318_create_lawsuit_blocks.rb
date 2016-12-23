class CreateLawsuitBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :lawsuit_blocks do |t|
      t.integer :weight, null: false, default: 0
      t.references :lawsuit, foreign_key: true, null: false
      t.references :block, foreign_key: true, null: false

      t.timestamps
    end
  end
end
