class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string     :code # sku
      t.string     :name
      t.decimal    :price, precision: 10, scale: 2, null: false
      t.boolean    :active
      t.datetime   :available_on
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
