require 'rails_helper'

feature 'user creates a car', %Q{
 As a car salesperson
 I want to record a newly acquired car
 So that I can list it in my lot
} do

# I must specify the manufacturer, color, year, and mileage of the car.
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information
# in the required formats, the car is recorded
# and I am presented with a notification of success
# If I do not specify all of the required information
# in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'user adds a car with no issues' do
    manu = FactoryGirl.create(:car_manufacturer, name: 'Jeep')

    visit new_car_path
    select 'Jeep', from: 'Car manufacturer'
    fill_in 'Color', with: "White"
    fill_in 'Year', with: '2000'
    fill_in 'Mileage', with: '85000'
    fill_in 'Description', with: 'Like a Rock'
    click_on 'Create Car'

    expect(page).to have_content 'Jeep'
    expect(page).to have_content 'White'
    expect(page).to have_content '2000'
    expect(page).to have_content '85000'
  end

  scenario 'user does not fill in required content' do
    visit new_car_path
    click_on 'Create Car'

    expect(page).to have_content 'Error!'
  end
end
