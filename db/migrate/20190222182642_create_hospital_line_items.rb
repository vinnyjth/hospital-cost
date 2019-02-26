class CreateHospitalLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_line_items do |t|
      t.belongs_to :hospital, index: true
      t.belongs_to :line_item, index: true
      t.integer :price, index: true

      t.timestamps
    end
  end
end
