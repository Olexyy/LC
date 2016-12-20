class AddRowsToBlockGroup < ActiveRecord::Migration[5.0]
  def up
    BlockGroup.create(name: 'Загальний розділ', weight: 0 )
  end

  def down
    BlockGroup.destroy_all(name: [ 'Загальний розділ', ] )
  end
end
