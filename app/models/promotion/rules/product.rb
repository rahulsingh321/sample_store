class Promotion
  module Rules
    class Product < PromotionRule
      has_many :product_promotion_rules, class_name: 'ProductPromotionRule',
                                         foreign_key: :promotion_rule_id,
                                         dependent: :destroy
      has_many :products, through: :product_promotion_rules, class_name: 'Product'

      def eligible_products
        products
      end

      def eligible?(cart, _options = {})
        return true if eligible_products.empty?

        cart.products.any? { |p| eligible_products.include?(p) } # TODO: pass cart object
      end
    end
  end
end
