class Promotion < ApplicationRecord
  validates :name, presence: true

  has_many :promotion_rules, autosave: true, dependent: :destroy
  alias rules promotion_rules

  has_many :promotion_actions, autosave: true, dependent: :destroy
  alias actions promotion_actions
end
