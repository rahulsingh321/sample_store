class PromotionAction < ApplicationRecord
  belongs_to :promotion

  # This method should be overriden in subclass
  def perform(_options = {})
    raise 'perform should be implemented in a sub-class of PromotionAction'
  end
end
