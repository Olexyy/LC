class CreateBlockFieldBlockParts < ActiveRecord::Migration[5.0]
  def change
    create_table :block_field_block_parts do |t|
      t.references :block_field, foreign_key: true
      t.references :block_part, foreign_key: true

      t.timestamps
    end
  end
end
