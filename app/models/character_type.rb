class CharacterType < ActiveRecord::Base
  has_many :castes, dependent: :destroy
end
