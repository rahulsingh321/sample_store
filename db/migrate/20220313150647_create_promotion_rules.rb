class CreatePromotionRules < ActiveRecord::Migration[6.1]
  def change
    create_table :promotion_rules do |t|

      t.timestamps
    end
  end
end
