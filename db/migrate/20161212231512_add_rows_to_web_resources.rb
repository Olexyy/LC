class AddRowsToWebResources < ActiveRecord::Migration[5.0]
  def up
      WebResource.create(name: 'About', title: 'About', body:'<p>Lorem ipsum semper dolore</p>', key:'about', weight: 0 )
      WebResource.create(name: 'Advices', title: 'Advices', body:'<p>Lorem ipsum semper dolore</p>', key:'advices', weight: 0 )
  end

  def down
    WebResource.destroy_all(key: 'about' )
    WebResource.destroy_all(key: 'advices')
  end
end
