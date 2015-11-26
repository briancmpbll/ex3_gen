# View helpers for the anima effects controller
module AnimaEffectsHelper
  def edit_path(parent, anima_effect)
    if parent.is_a?(CharacterType)
      edit_character_type_anima_effect_path(parent, anima_effect)
    else
      edit_character_type_caste_anima_effect_path(parent, anima_effect)
    end
  end

  def parent_path(parent)
    if parent.is_a?(CharacterType)
      character_type_path(parent)
    else
      character_type_caste_path(parent)
    end
  end

  def new_path(parent)
    if parent.is_a?(CharacterType)
      new_character_type_anima_effect_path
    else
      new_character_type_caste_anima_effect_path
    end
  end

  def list_url(parent)
    if parent.is_a?(CharacterType)
      character_type_anima_effects_url
    else
      character_type_caste_anima_effects_url
    end
  end
end
