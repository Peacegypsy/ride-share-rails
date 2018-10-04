class Passenger < ApplicationRecord
  has_many :trips
  def currency
     return "$#{'%.2f' % (self.cost * 0.01)}"
   end
end
