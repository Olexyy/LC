class AddRowsToWebResources < ActiveRecord::Migration[5.0]
  def up
      WebResource.create(name: 'Про проект', title: 'Про проект', body:'<p>Проект наразі є тестовим та потребує дуже багато:</p><ul><li>часу;</li><li>надхнення;</li><li>бажання;</li></ul><p>Веселих свят!&nbsp;</p>', key:'about', weight: 0 )
      WebResource.create(name: 'Поради', title: 'Поради', body:'<p>На цій сторінці буде йти мова про те, як треба подавати позов, як поводитись в суді, де знайти реквізити для оплати мита та інші цікаві деталі.</p>', key:'advices', weight: 0 )
  end

  def down
    WebResource.destroy_all(key: [ :about, :advices ] )
  end
end
