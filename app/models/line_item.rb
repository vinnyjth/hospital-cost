class LineItem < ApplicationRecord
  has_many :hospital_line_items
  has_many :hospitals, through: :hospital_line_items
end

