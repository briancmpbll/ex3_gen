# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

physical = AttributeCategory.create([{name: 'Physical'}]).first
social   = AttributeCategory.create([{name: 'Social'}]).first
mental   = AttributeCategory.create([{name: 'Mental'}]).first

attributes = CharacterAttribute.create([
  {name: 'Strength',      attribute_category: physical},
  {name: 'Dexterity',     attribute_category: physical},
  {name: 'Stamina',       attribute_category: physical},
  {name: 'Charisma',      attribute_category: social},
  {name: 'Manipulation',  attribute_category: social},
  {name: 'Appearance',    attribute_category: social},
  {name: 'Perception',    attribute_category: mental},
  {name: 'Intelligence',  attribute_category: mental},
  {name: 'Wits',          attribute_category: mental},
])

