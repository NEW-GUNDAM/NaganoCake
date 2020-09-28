class Address < ApplicationRecord
  belongs_to :customer

  validates :zipcode, format: {with: /\A\d{7}\z/}, numericality: true



  def full_address
    self.zipcode + self.address + self.ship_name
  end
end