class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :name, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0
      t.references :block_group, foreign_key: true, :null => false
      # auto / conditional
      t.integer :include_type, :null => false, :default => 0
      # what is this??? -> cont type have fields
      #t.integer :content_type, :null => false, :default => 0
      #nullable ref to field if! block block is conditional ( BOOLEAN field )
      t.references :block_field, foreign_key: true, null: true
      t.timestamps
    end
  end
end
