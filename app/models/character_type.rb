class CharacterType < ActiveRecord::Base
  has_many :castes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
