class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :code
      t.string :name
      t.string :url
      t.text   :description
      t.string :default_currency

      t.timestamps
    end
  end
end
