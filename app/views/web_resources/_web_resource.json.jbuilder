json.extract! web_resource, :id, :name, :title, :body, :key, :weight, :created_at, :updated_at
json.url web_resource_url(web_resource, format: :json)