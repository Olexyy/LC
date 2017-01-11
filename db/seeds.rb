User.create(email: "admin@example.com", password: "Qq1111")
BlockGroup.create!([
  {name: "Загальний розділ", weight: 0}
])
Block.create!([
  {name: "Тестовий блок1", weight: 0, block_subgroup_id: 1, include_type: "Автоматичне", block_field_id: nil},
  {name: "Тестовий блок2", weight: 0, block_subgroup_id: 1, include_type: "Автоматичне", block_field_id: nil},
  {name: "Тестовий блок3", weight: 0, block_subgroup_id: 1, include_type: "Автоматичне", block_field_id: nil}
])
BlockField.create!([
  {name: "Дата протоколу", text: "Вкажіть дату протоколу", weight: 0, data_type: "Текст", marker: "дата_протоколу"},
  {name: "Питання про сніданок", text: "Ви сьогодні снідали?", weight: 0, data_type: "Питання", marker: ""}
])
BlockPart.create!([
  {name: "Тестова частина блоку1", text: "<p style=\"text-align:right\"><em><u>Тестова частина один першого блоку. #дата_протоколу &nbsp;dsfds&nbsp;#дата_протоколу</u></em></p>\r\n", weight: 0, block_id: 1},
  {name: "Тестова частина блоку1 (2)", text: "<p><strong>Тестова частина&nbsp;2 першого блоку</strong></p>\r\n", weight: 1, block_id: 1},
  {name: "Блок 2", text: "<p style=\"text-align:center\"><strong><u><em>Текст першої частини другого блоку.</em></u></strong></p>\r\n", weight: 0, block_id: 2},
  {name: "Частина блоку", text: "<p><s><em>Текст третього блоку (1частина)</em></s></p>\r\n", weight: 0, block_id: 3}
])
BlockFieldBlockPart.create!([
  {block_field_id: 1, block_part_id: 1, weight: 0}
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
LawsuitBlock.create!([
  {weight: 0, lawsuit_id: 1, block_id: 1}, {weight: 1, lawsuit_id: 1, block_id: 2},
  {weight: 2, lawsuit_id: 1, block_id: 3}
])