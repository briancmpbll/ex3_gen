# Concern for models that require a unique name
module Nameable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness: true
  end
end
