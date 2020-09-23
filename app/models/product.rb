class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items
  attachment :image


    TAX = 1.1

    def tax_price
      tax_price = price * TAX
      tax_price.round
    end
end
