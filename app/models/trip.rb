class Trip < ApplicationRecord
  def currency
    return "$#{'%.2f' % (self.cost * 0.01)}"
  end
end
