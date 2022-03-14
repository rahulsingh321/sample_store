class CreatePromotionActions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotion_actions do |t|

      t.timestamps
    end
  end
end
