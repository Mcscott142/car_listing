class CarManufacturer < ActiveRecord::Base
  has_many :cars

  validates :name, presence: true
  validates :country, presence: true
end
