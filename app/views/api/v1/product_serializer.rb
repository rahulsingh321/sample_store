module Api
  module V1
    class ProductSerializer < ::Api::V1::BaseSerializer
      set_type :product

      attributes :name, :description, :available_on, :updated_at, :code

      belongs_to :store
    end
  end
end
