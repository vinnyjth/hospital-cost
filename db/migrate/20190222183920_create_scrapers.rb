class CreateScrapers < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapers do |t|
      t.belongs_to :hospital, index: true

      t.string :strategy
      t.string :url

      t.text :scrape_config

      t.datetime :last_run_at

      t.boolean :active

      t.timestamps
    end
  end
end
