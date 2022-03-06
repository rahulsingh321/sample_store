module Api
  module V1
    module DisplayMoneyHelper
      extend ActiveSupport::Concern

      class_methods do
        def display_price(price, currency = nil)
          currency ||= Store.first.default_currency
          in_cents = (price.to_f * 100)

          Money.new(in_cents, currency).format
        end
      end
    end
  end
end
