# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Default Store
print "####### Create default store ###### \n"

eu_store = Store.find_or_initialize_by(code: 'eustore')
eu_store.name = 'EU Store'
eu_store.url = 'eu.lvh.me:3000'
eu_store.default_currency = 'EUR'
eu_store.save!


# Products
print "##### Create products ##### \n"

[
  { code: 'MUG', name: 'Reedsy Mug', price: 6.00 },
  { code: 'TSHIRT', name: 'Reedsy T-shirt', price: 15.00 },
  { code: 'HOODIE', name: 'Reedsy Hoodie', price: 20.00 }
]
.each do |product_attrs|
  eu_store.products.where(code: product_attrs[:code]).first_or_create! do |product|
    product.name = product_attrs[:name]
    product.price = product_attrs[:price]
    product.active = true
    product.available_on = Time.current - 1.day
    product.save!
  end
end
