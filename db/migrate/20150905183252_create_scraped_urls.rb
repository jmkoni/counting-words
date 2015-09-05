class CreateScrapedUrls < ActiveRecord::Migration
  def change
    create_table :scraped_urls do |t|
      t.string :url
      t.hstore :word_count

      t.timestamps
    end
  end
end
