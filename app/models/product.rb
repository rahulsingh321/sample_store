class Product < ApplicationRecord
  belongs_to :store

  def self.available(available_on = nil)
    available_on ||= Time.current

    where('active = ? and available_on <= ?', true, available_on)
  end
end
