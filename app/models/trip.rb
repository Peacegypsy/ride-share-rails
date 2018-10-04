class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  
  def currency
     return "$#{'%.2f' % (self.cost * 0.01)}"
   end
end
