module Api
  module V1
    class ProductsController < Api::BaseController
      before_action :find_product, only: [:update]

      def index
        @products = current_store.products.available
        render_serialized_payload { serialize_collection(@products) }
      end

      def update
        @product.update(product_params)
        render_serialized_payload { serialize_resource(@product) }
      end

      def check_price
        items = params[:items].gsub(/\s+/, '').split(',')
        freq  = items.group_by { |item| item }.transform_values!(&:size)
        items = Product.where(code: freq.keys).pluck(:code, :price).to_h

        amount = 0
        items.each do |item, price|
          amount += (freq[item] * price)
        end

        render json: { I18n.t(:total) => Rails.application.helpers.display_price(amount) }.as_json, status: 200,
               content_type: 'application/json'
      end

      def model_class
        Product
      end

      private

      def product_params
        params.require(:product).permit!
      end

      def find_product
        @product = Product.find(params[:id])
      end
    end
  end
end


# Cart
#   total -
#   item_total -
#   adjustment_total
#   created_at -
#   updated_at -


#   line_items
#     cart_id
#     product_id
#     quantity
#     price
#     currency
#     adjustment_total


# Promotion
#  name: 'Buy 2 get 1 free'
#  product_ids: [1]

#  rules:                        actions:
#   product_ids IN []              OncreateLineitem           3/2

# Promotion
#   name: '30% OFF'

#   rules:                       actions:
#     => product_ids IN []           OncreateLineitem
#     => quantity >= 3







#  Promotion
#    name: '30% OFF'

#    actions:
#      percent: 30%






# Product
#   price  x   quantity =  amount
