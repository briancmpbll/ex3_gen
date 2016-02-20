# View helpers for the anima effects controller
module AnimaEffectsHelper
  def parent_path(parent)
    if parent.is_a?(CharacterType)
      character_type_path(parent)
    else
      caste_path(parent)
    end
  end

  def new_path(parent)
    if parent.is_a?(CharacterType)
      new_character_type_anima_effect_path
    else
      new_character_type_caste_anima_effect_path
    end
  end
end
