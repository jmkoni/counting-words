class ScrapedUrl < ActiveRecord::Base
  def highest_word_count
    word_count.sort.last
  end
end
