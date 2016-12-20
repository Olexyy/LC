User.create(email: "admin@example.com", password: "Qq1111")

Block.create!([
  {name: "Тестовий блок", weight: 0, block_subgroup_id: 1, include_type: "Автоматичне", block_field_id: nil}
])

BlockPart.create!([
  {name: "Тестова частина блоку", text: "<p>Лорем іпсум</p>\r\n", weight: 0, block_id: 1}
])

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
