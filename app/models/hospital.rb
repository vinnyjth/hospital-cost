class Hospital < ApplicationRecord
  has_one :scraper
  has_many :hospital_line_items
  has_many :line_items, through: :hospital_line_items

  accepts_nested_attributes_for :scraper

  def create_scraping_job
    return nil if !scraper

    scraper.job
  end

  def run_scraping_job
    job = create_scraping_job
    job.perform(scraper.id) if job
  end
end
