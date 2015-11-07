# Concern for models that can own anima effects
module AnimaEffectOwner
  extend ActiveSupport::Concern

  included do
    has_many :anima_effects, dependent: :destroy
  end
end
