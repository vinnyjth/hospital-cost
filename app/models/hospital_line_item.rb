class HospitalLineItem < ApplicationRecord
  belongs_to :hospital
  belongs_to :line_item

end
