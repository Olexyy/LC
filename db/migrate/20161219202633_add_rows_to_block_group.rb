class AddRowsToBlockGroup < ActiveRecord::Migration[5.0]
  def up
    BlockGroup.create(name: 'Вступна частина', weight: 0 )
    BlockGroup.create(name: 'Описова частина', weight: 0 )
    BlockGroup.create(name: 'Резулятивна частина', weight: 0 )
  end

  def down
    BlockGroup.destroy_all(name: [ 'Вступна частина', 'Описова частина', 'Резулятивна частина' ] )
  end
end
