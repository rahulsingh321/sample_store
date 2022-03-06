module Api
  module V1
    class ProductSerializer < Api::V1::BaseSerializer
      include Api::V1::DisplayMoneyHelper

      set_type :product

      attributes :name, :code, :available_on, :updated_at

      attribute :price do |product|
        display_price(product.price, product.currency)
      end

      belongs_to :store
    end
  end
end
