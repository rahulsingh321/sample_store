class Product < ApplicationRecord
  belongs_to :store

  def self.available(available_on = nil)
    available_on ||= Time.current

    where('active = ? and available_on <= ?', true, available_on)
  end

  # def amount(qty: 1)
  #   (price * qty) + adjustment_total
  # end

  # def adjustment_total
  #   promotions.each do |promo|
  #     promo.apply?(product)
  #   end
  #   .sum
  # end

end



# items = MUG, TSHIRT, HOODIE

# MUG - 1
# TSHIRT - 2
# HOODIE - 1

# product.each do |product, qty|
#   amount = product.amount(qty)
# end



# def amount(qty: 1)
#   item_total = price * qty

#   promotions.each do |promo|
#     promo.apply(product, qty)
#   end
# end


