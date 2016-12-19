BlockGroup.create!([
   {name: "Вступна частина", weight: 0}
])
Block.create!([
  {name: "Тестовий блок", weight: 0, block_group_id: 1, include_type: "Автоматичне", block_field_id: nil}
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
WebResource.create!([
  {name: "Про проект", title: "Про проект", body: "<p>Проект наразі є тестовим та потребує дуже багато:</p><ul><li>часу;</li><li>надхнення;</li><li>бажання;</li></ul><p>Веселих свят!&nbsp;</p>", key: "about", weight: 0},
  {name: "Поради", title: "Поради", body: "<p>На цій сторінці буде йти мова про те, як треба подавати позов, як поводитись в суді, де знайти реквізити для оплати мита та інші цікаві деталі.</p>", key: "advices", weight: 0}
])
