class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :default_currency
      t.text   :description

      t.timestamps
    end
  end
end
