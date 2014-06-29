require 'rails_helper'

feature 'user creates a manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types
  of cars found in the lot
} do

# I must specify a manufacturer name and country.
# If I do not specify the required information,
# I am presented with errors.
# If I specify the required information, the manufacturer is recorded and
# I am redirected to the index of manufacturers

  scenario 'user adds a manufacturer with no issues' do

    visit new_car_manufacturer_path
    fill_in 'Name', with: 'Jeep'
    fill_in 'Country', with: "'Merica"
    click_on 'Create Car manufacturer'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Jeep'
    expect(page).to have_content 'Merica'
  end

  scenario 'user does not fill in required content' do
    visit new_car_manufacturer_path
    click_on 'Create Car manufacturer'

    expect(page).to have_content 'Error!'
  end
end



