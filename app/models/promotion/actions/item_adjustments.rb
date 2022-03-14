class Promotion
  module Actions
    class ItemAdjustments < PromotionAction
      FLAT_PERCENT = 30

      def perform(options = {})
        line_item = options[:line_item]
        promotion = options[:promotion]

        line_item.adjustment_total = (line_item.amount * (FLAT_PERCENT/100).to_f)) * -1
        line_item.save
        line_item.adjustment_total
      end
    end
  end
end
