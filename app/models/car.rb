class Car < ActiveRecord::Base
  belongs_to :car_manufacturer

  validates :car_manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true, if: :after_1920?
  validates :mileage, presence: true


  def after_1920?
    if self.year > 1920
      true
    else
      false
    end
  end
end
