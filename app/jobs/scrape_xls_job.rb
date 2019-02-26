require 'creek'
require 'open-uri'

class ScrapeXlsJob < ActiveJob::Base
  def perform(scraper_id)
    scraper = Scraper.find(scraper_id)
    hospital = scraper.hospital
    config = scraper.config

    doc = Creek::Book.new scraper.url, remote: true

    price_row = config.try(:[], 'price_row') || 2
    label_row = config.try(:[], 'label_row') || 1

    puts price_row, label_row
    LineItem.transaction do
      HospitalLineItem.transaction do
        hospital_line_items = doc.sheets[0].rows.each do |row|
          label = row.values[label_row]
          price = row.values[price_row]
          next if !label || !price
          line_item = LineItem.where(label: label).first_or_create(label: label)
          hospital_line_item = HospitalLineItem.where(line_item: line_item, hospital: hospital).first_or_create.update(price: price * 100)
        end
      end
    end
  end
end
