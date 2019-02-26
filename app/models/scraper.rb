require 'yaml'

class Scraper < ApplicationRecord
  belongs_to :hospital

  def job
    if strategy == 'csv'
      return ScrapeCsvJob.new
    end
    if strategy == 'xls'
      return ScrapeXlsJob.new
    end
  end

  def config
    YAML.load(scrape_config) if scrape_config != nil
  end
end
