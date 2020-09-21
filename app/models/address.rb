class Address < ApplicationRecord
  belongs_to :customer



  def full_address
    self.zipcode + self.address + self.ship_name
  end
end