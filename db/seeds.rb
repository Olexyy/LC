Category.create!([
  {name: "Адміністративні позови", weight: -1},
  {name: "Нова категорія", weight: 0}
])
Subcategory.create!([
  {name: "ДТП", category_id: 1, weight: 1}
])
Lawsuit.create!([
  {name: "Позов про порушення парковки", weight: 1, subcategory_id: 1, web_resource_id: nil}
])
