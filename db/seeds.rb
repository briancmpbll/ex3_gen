# This file should contain all the record creation needed to seed the database with its default
# values. The data can then be loaded with the rake db:seed (or created alongside the db with
# db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

physical = AttributeCategory.create(name: 'Physical')
social   = AttributeCategory.create(name: 'Social')
mental   = AttributeCategory.create(name: 'Mental')

CharacterAttribute.create([
  { name: 'Strength',      attribute_category: physical },
  { name: 'Dexterity',     attribute_category: physical },
  { name: 'Stamina',       attribute_category: physical },
  { name: 'Charisma',      attribute_category: social },
  { name: 'Manipulation',  attribute_category: social },
  { name: 'Appearance',    attribute_category: social },
  { name: 'Perception',    attribute_category: mental },
  { name: 'Intelligence',  attribute_category: mental },
  { name: 'Wits',          attribute_category: mental }
])

archery       = Ability.create(name: 'Archery')
athletics     = Ability.create(name: 'Athletics')
awareness     = Ability.create(name: 'Awareness')
brawl         = Ability.create(name: 'Brawl')
bureacracy    = Ability.create(name: 'Bureacracy')
craft         = Ability.create(name: 'Craft')
dodge         = Ability.create(name: 'Dodge')
integrity     = Ability.create(name: 'Integrity')
investigation = Ability.create(name: 'Investigation')
larceny       = Ability.create(name: 'Larceny')
linguistics   = Ability.create(name: 'Linguistics')
lore          = Ability.create(name: 'Lore')
martial_arts  = Ability.create(name: 'Martial Arts')
medicine      = Ability.create(name: 'Medicine')
melee         = Ability.create(name: 'Melee')
occult        = Ability.create(name: 'Occult')
performance   = Ability.create(name: 'Performance')
presence      = Ability.create(name: 'Presence')
resistence    = Ability.create(name: 'Resistence')
ride          = Ability.create(name: 'Ride')
sail          = Ability.create(name: 'Sail')
socialize     = Ability.create(name: 'Socialize')
stealth       = Ability.create(name: 'Stealth')
survival      = Ability.create(name: 'Survival')
thrown        = Ability.create(name: 'Thrown')
war           = Ability.create(name: 'War')

solar = CharacterType.create([{ name: 'Solar Exalt' }]).first

dawn = Caste.create(
  name: 'Dawn Caste',
  character_type: solar,
  abilities: [archery, awareness, brawl, martial_arts, dodge, melee, resistence, thrown, war])
zenith = Caste.create(
  name: 'Zenith Caste',
  character_type: solar,
  abilities: [athletics, integrity, performance, lore, presence, resistence, survival, war])
twilight = Caste.create(
  name: 'Twilight Caste',
  character_type: solar,
  abilities: [bureacracy, craft, integrity, investigation, linguistics, lore, medicine, occult])
night = Caste.create(
  name: 'Night Caste',
  character_type: solar,
  abilities: [athletics, awareness, dodge, investigation, larceny, ride, stealth, socialize])
eclipse = Caste.create(
  name: 'Eclipse Caste',
  character_type: solar,
  abilities: [bureacracy, larceny, linguistics, occult, presence, ride, sail, socialize])

AnimaEffect.create([
  { character_type: solar,
    condition: 'Spend 1 mote of Essence',
    effect: 'The Solar may feel the brilliant presence of the sun relative to herself and know the
            exact time of day thereby. This works even if she’s underground or in the Wyld beyond
            Creation.' },
  { character_type: solar,
    condition: 'Spend 1 mote of Essence',
    effect: 'The Solar may cause her Caste Mark to appear anddisplay itself for as long as she
            desires.' },
  { character_type: solar,
    caste: dawn,
    condition: 'Bonfine/iconic anima display',
    effect: 'The Dawn adds half her Essence score (round up) to her base Initiative upon resetting
            to base after a successful decisive attack.' },
  { character_type: solar,
    caste: dawn,
    condition: 'Spend 10 motes of Essence',
    effect: 'All of the Dawn’s combat and movement Charms with outstanding reset conditions are
            automatically reset. This effect can only be used once per day, becoming available again
            at sunrise.' },
  { character_type: solar,
    caste: dawn,
    condition: 'Passive',
    effect: 'The Dawn Caste inspires terror in her foes. She adds half her Essence score (round up)
            in dice to all intimidating social influence. She may also intimidate targets which do
            not feel fear, such as automatons, golems, and certain undead.' },
  { character_type: solar,
    caste: zenith,
    condition: 'Spend 1 mote of Essence',
    effect: 'The Zenith’s anima leaps from her hand to a corpse she’s touching, igniting it in Solar
            flame. This power incinerates the corpse and ensures the soul of the deceased will not
            return as a hungry ghost. In addition, the Zenith may perceive the strongest Intimacies
            of the deceased and may choose to accept them. When she is ready, she may pay one mote,
            touching a target of those Intimacies to pass on feelings of peace, love, and assurance,
            shedding them in the process. She may also transfer them to an object, allowing it to
            convey comfort or a sense of duty to the subject. Conversely, she may touch someone who
            caused the deceased to suffer, paying one mote and rolling ([A social Attribute] +
            Presence) with three automatic non-Charm successes against their Resolve to transfer
            pain suffered by the deceased back on the one who caused it. The Storyteller is free to
            dictate the length and weight of such attrition.' },
  { character_type: solar,
    caste: zenith,
    condition: 'Spend 10 motes of Essence and 1 Willpower',
    effect: 'The Zenith channels her Essence into an aura of divine retribution, surging around an
            attack. This power supplements a successful decisive attack against a creature of
            darkness, preventing the Solar’s Initiative from returning to its base value after the
            attack. When the Zenith’s anima is at bonfire, reduce the cost of this power by five
            motes and ignore the Willpower. This power may only be used once per day, resetting
            when the sun is at its zenith.'
  }
])
