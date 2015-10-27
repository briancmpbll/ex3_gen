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

archery       = Ability.create([{name: 'Archery'}]).first
athletics     = Ability.create([{name: 'Athletics'}]).first
awareness     = Ability.create([{name: 'Awareness'}]).first
brawl         = Ability.create([{name: 'Brawl'}]).first
bureacracy    = Ability.create([{name: 'Bureacracy'}]).first
craft         = Ability.create([{name: 'Craft'}]).first
dodge         = Ability.create([{name: 'Dodge'}]).first
integrity     = Ability.create([{name: 'Integrity'}]).first
investigation = Ability.create([{name: 'Investigation'}]).first
larceny       = Ability.create([{name: 'Larceny'}]).first
linguistics   = Ability.create([{name: 'Linguistics'}]).first
lore          = Ability.create([{name: 'Lore'}]).first
martial_arts  = Ability.create([{name: 'Martial Arts'}]).first
medicine      = Ability.create([{name: 'Medicine'}]).first
melee         = Ability.create([{name: 'Melee'}]).first
occult        = Ability.create([{name: 'Occult'}]).first
performance   = Ability.create([{name: 'Performance'}]).first
presence      = Ability.create([{name: 'Presence'}]).first
resistence    = Ability.create([{name: 'Resistence'}]).first
ride          = Ability.create([{name: 'Ride'}]).first
sail          = Ability.create([{name: 'Sail'}]).first
socialize     = Ability.create([{name: 'Socialize'}]).first
stealth       = Ability.create([{name: 'Stealth'}]).first
survival      = Ability.create([{name: 'Survival'}]).first
thrown        = Ability.create([{name: 'Thrown'}]).first
war           = Ability.create([{name: 'War'}]).first

solar = CharacterType.create([{name: 'Solar Exalt'}]).first

castes = Caste.create([
  {name: "Dawn Caste",
   anima_effect: "Test",
   character_type: solar,
   abilities: [archery, awareness, brawl, martial_arts, dodge, melee,
    resistence, thrown, war]},
  {name: "Zenith Caste",
   anima_effect: "Test",
   character_type: solar,
   abilities: [athletics, integrity, performance, lore, presence, resistence,
    survival, war]},
  {name: "Twilight Caste",
   anima_effect: "Test",
   character_type: solar,
   abilities: [bureacracy, craft, integrity, investigation, linguistics, lore,
    medicine, occult]},
  {name: "Night Caste",
   anima_effect: "Test",
   character_type: solar,
   abilities: [athletics, awareness, dodge, investigation, larceny, ride,
    stealth, socialize]},
  {name: "Eclipse Caste",
   anima_effect: "Test",
   character_type: solar,
   abilities: [bureacracy, larceny, linguistics, occult, presence, ride,
    sail, socialize]}
])
