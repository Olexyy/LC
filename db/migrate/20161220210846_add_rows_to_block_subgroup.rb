class AddRowsToBlockSubgroup < ActiveRecord::Migration[5.0]
  def up
    BlockSubgroup.create(name: 'Вступна частина', weight: 0, block_group_id: 1 )
    BlockSubgroup.create(name: 'Описова частина', weight: 0, block_group_id: 1 )
    BlockSubgroup.create(name: 'Резулятивна частина', weight: 0, block_group_id: 1 )
  end

  def down
    BlockSubgroup.destroy_all(name: [ 'Вступна частина', 'Описова частина', 'Резулятивна частина' ] )
  end
end
