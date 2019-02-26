class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :city
      t.string :state, index: true
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
