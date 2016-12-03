class CreateTextStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :text_styles do |t|
      t.string :name, :limit => 150, :null => false
      t.integer :weight, :null => false, :default => 0
      t.integer :tag, :null => false, :default => 0
      t.integer :margin_left, :null => false, :default => 0
      t.integer :text_align, :null => false, :default => 0
      t.boolean :strong, :null => false, :default => false
      t.boolean :underline, :null => false, :default => false
      t.boolean :italic, :null => false, :default => false

      t.timestamps
    end
  end
end
