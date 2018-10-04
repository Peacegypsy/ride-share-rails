class Driver < ApplicationRecord
  has_many :trips

  validates :vin, presence: true
  validates :name, presence: true

  def total_earnings
    sum = 0
    self.trips.each do |trip|
      decimal_move = trip.cost
      decimal_move *= 0.01
      sum += (decimal_move - 1.65 )  * 0.8
    end
    return '%.2f' % sum
  end

  def average_rating
    ratings = 0
    self.trips.each do |trip|
      ratings += trip.rating if !(trip.rating.nil?)
    end
    if ratings == 0
      return "Not yet rated"
    else
      return (ratings.to_f / self.trips.length).round(2)
    end
  end

end
