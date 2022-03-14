class PromotionRule < ApplicationRecord
  belongs_to :promotion, inverse_of: :promotion_rules

  def eligible?(_promotable, _options = {})
    raise 'eligible? should be implemented in a sub-class of PromotionRule'
  end
end
