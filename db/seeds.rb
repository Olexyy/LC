# rake db:seed:dump
User.create!([
  {email: "admin@example.com", encrypted_password: "$2a$11$KLfce..AEjFH4qmHOuPQQ.HbZUeEN1cTSQbt4eZsb0G1l0eBCp25u", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2016-12-12 23:00:14", sign_in_count: 9, current_sign_in_at: "2016-12-13 18:50:11", last_sign_in_at: "2016-12-12 23:00:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Category.create!([
  {name: "Адміністративні позови", weight: -1},
  {name: "Нова категорія", weight: 0}
])
Lawsuit.create!([
  {name: "Позов про порушення парковки", weight: 1, subcategory_id: 1, web_resource_id: nil}
])
Subcategory.create!([
  {name: "ДТП", category_id: 1, weight: 1}
])
