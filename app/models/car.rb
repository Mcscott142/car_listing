class Car < ActiveRecord::Base
  belongs_to :car_manufacturer

  validates :car_manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validate :after_1920?


  def after_1920?
    if year.present? && year < 1920
      errors.add(:year, "Must be 1920 or later")
    end
  end
end
