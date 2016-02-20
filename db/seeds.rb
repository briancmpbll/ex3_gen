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
  { caste: dawn,
    condition: 'Bonfine/iconic anima display',
    effect: 'The Dawn adds half her Essence score (round up) to her base Initiative upon resetting
            to base after a successful decisive attack.' },
  { caste: dawn,
    condition: 'Spend 10 motes of Essence',
    effect: 'All of the Dawn’s combat and movement Charms with outstanding reset conditions are
            automatically reset. This effect can only be used once per day, becoming available again
            at sunrise.' },
  { caste: dawn,
    condition: 'Passive',
    effect: 'The Dawn Caste inspires terror in her foes. She adds half her Essence score (round up)
            in dice to all intimidating social influence. She may also intimidate targets which do
            not feel fear, such as automatons, golems, and certain undead.' },
  { caste: zenith,
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
  { caste: zenith,
    condition: 'Spend 10 motes of Essence and 1 Willpower',
    effect: 'The Zenith channels her Essence into an aura of divine retribution, surging around an
            attack. This power supplements a successful decisive attack against a creature of
            darkness, preventing the Solar’s Initiative from returning to its base value after the
            attack. When the Zenith’s anima is at bonfire, reduce the cost of this power by five
            motes and ignore the Willpower. This power may only be used once per day, resetting
            when the sun is at its zenith.'
  },
  { caste: zenith,
    condition: 'Spend 7 motes of Essence',
    effect: 'The Zenith may order a dematerialized spirit to manifest using a (Charisma + Presence)
            persuade action with (Essence) automatic successes. All spirits inherently recognize the
            Unconquered Sun’s authority in the priest-kings and are compelled as if by a Defining
            Intimacy, but may still have Defining Ties or Principles which counter this advantage.
            If successful, the Zenith’s very command draws the spirit into the material world, so
            that it does not need to pay the cost to materialize.'
  },
  { caste: twilight,
    condition: 'Spend 5 motes of Essence',
    effect: 'The Twilight projects an aura of pure force, reflexively gaining five Hardness for one
            turn. At the bonfire/iconic level, this power activates itself automatically at no cost.
            This effect doesn’t stack with other magic that raises Hardness, but it can be used
            during Initiative Crash.'
  },
  { caste: twilight,
    condition: 'Spend 10 motes of Essence and 1 Willpower',
    effect: 'The Twilight’s anima flares blue and white and consumes her body over the course of the
            round. On her next turn, she vanishes into her anima and ceases to exist. If the Exalt
            moves or suffers knockdown before the action is completed, it fails and the effect is
            wasted. After using this power, the Twilight will not reappear until the following
            sunset. When she does, it will be at a place of power within 10 miles of her vanishing
            point, chosen by the Storyteller. She might appear at a temple, a demesne, a major
            crossroads, the door of a god’s sanctum, the precise center of a city, etc.'
  },
  { caste: twilight,
    condition: 'Spend 10 motes',
    effect: 'The Twilight may touch an Essence 1-3 elemental or a demon of the first circle,
            conjoining its Essence to her anima. Roll Intelligence + Occult against the creature’s
            Resolve. If successful, this creates a pact that changes the spirit into her familiar,
            allowing her to target it with applicable Survival Charms. In addition, the Twilight can
            reflexively summon the spirit instantly for three motes, drawing it through the Essence
            of the world to appear beside her. She may banish the creature again, reflexively, for
            free, returning it to the tides of Essence that suffuse Creation until needed. The
            Twilight may have up to (Essence) spirit familiars bound in this fashion at once.'
  },
  { caste: night,
    condition: 'Spend 2 motes',
    effect: 'The Night can dampen her anima, treating all Peripheral Essence expenditures as if they
            were Personal for one instant.'
  },
  { caste: night,
    condition: 'Spend 3 motes',
    effect: 'The Night can ignore up to (higher of 3 or Essence) penalties to a Stealth attempt for
            one instant. These motes are always considered Personal, regardless of the pool they’re
            spent from.'
  },
  { caste: night,
    condition: 'Bonfire/iconic anima display',
    effect: 'The Night\'s anima wraps around and suffuses her form, hiding her figure and masking
            her visage in flame. She is merely a fearsome silhouette shrouded in all the hues of
            evening. It becomes impossible to discern her identity. This is considered a perfect
            effect, and cannot be pierced by Eye of the Unconquered Sun (see p. 273) or other
            all-seeing magic.'
  },
  { caste: eclipse,
    condition: 'Spend 10 motes and 1 Willpower',
    effect: 'The Eclipse sanctifies an oath she has witnessed. The Exalt touches the oathgivers (or
            their words, as they pass through the air), her caste mark flashing imperceptibly. If
            she wishes, her anima briefly flares, swirling with the words and runes by which Heaven
            has given her the right to arbitrate such matters. Oath-givers who break pacts
            sanctified by the Eclipse (including the Exalt herself ) are subject to a terrible
            curse. The details of the curse are devised by the Storyteller, ideally reflecting the
            oath broken. A woman who breaks a hospitality oath might find herself incapable of rest
            beneath any roof for a year and a day, while a man who murdered the one he swore to
            protect may find his defenses utterly failing him when he must next fight for his life.'
  },
  { caste: eclipse,
    condition: 'Passive',
    effect: 'The Eclipse has diplomatic immunity when treating with the enemies of Creation. So long
            as the Eclipse approaches them on legitimate business of some kind, shades, spirits, the
            demon princes of Hell, and the Fair Folk may not attack the Eclipse or her companions
            without just cause, and such creatures must observe the local rules of hospitality. Such
            beings may still attempt to provoke members of the Solar’s embassy into breaking the
            peace, thus voiding this effect’s protection.'
  },
  { caste: eclipse,
    condition: 'Passive',
    effect: 'The Eclipse represents all the subtle movements of Essence under Heaven, the strange
            and self-referencing powers that stir when night merges with day. Eclipses can learn the
            Charms of spirits, Fair Folk and similar supernatural beings which have the Eclipse
            keyword for eight experience points each.'
  }
])
