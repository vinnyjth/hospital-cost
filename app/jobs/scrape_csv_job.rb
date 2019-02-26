require 'csv'
require 'open-uri'

class ScrapeCsvJob < ActiveJob::Base
  def perform(scraper_id)
    scraper = Scraper.find(scraper_id)
    hospital = scraper.hospital

    csv_text = open(scraper.url)
    csv = CSV.parse(csv_text, :headers=>true)

    LineItem.transaction do
      HospitalLineItem.transaction do
        hospital_line_items = csv.each do |row|
          label = row[0]
          price = row[1].tr('$,.', '').to_i
          line_item = LineItem.where(label: label).first_or_create(label: label)
          hospital_line_item = HospitalLineItem.where(line_item: line_item, hospital: hospital).first_or_create.update(price: price)
        end
      end
    end
  end
end
