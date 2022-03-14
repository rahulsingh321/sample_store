class Promotion
  module Rules
    class MinQuantity < PromotionRule

      MIN_QUANTITY = 3.freeze

      def eligible?(line_item, _options = {})
        line_item.quantity >= MIN_QUANTITY
      end
    end
  end
end
