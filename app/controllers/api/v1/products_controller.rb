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
