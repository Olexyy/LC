json.extract! block_field, :id, :name, :text, :weight, :data_type, :marker, :created_at, :updated_at
json.url block_field_url(block_field, format: :json)