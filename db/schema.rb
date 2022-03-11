# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_227_141_637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'products', force: :cascade do |t|
    t.string 'code'
    t.string 'name'
    t.decimal 'price', precision: 10, scale: 2, null: false
    t.boolean 'active'
    t.datetime 'available_on'
    t.string 'currency'
    t.bigint 'store_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['store_id'], name: 'index_products_on_store_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'code'
    t.string 'name'
    t.string 'url'
    t.string 'default_currency'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'products', 'stores'
end
