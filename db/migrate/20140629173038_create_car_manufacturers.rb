class CreateCarManufacturers < ActiveRecord::Migration
  def change
    create_table :car_manufacturers do |t|
      t.string :name, null:false
      t.string :country, null: false

      t.timestamps
    end
  end
end
