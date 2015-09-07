class ScrapedUrl < ActiveRecord::Base
  validates :url, uniqueness: true
  COMMON_WORDS = ["the","of","and","a","to","in","is","you","that","it","he","was","for","on","are","as","with","his","they","I","at","be","this","have","from","or","one","had","by","but","not","what","all","were","we","when","your","can","said","there","use","an","each","which","she","do","how","their","if","will","then","them","these","so","some","her","would","make","like","him","into","has","go","see","no","way","could","my","than","been","call","who","its","may","i"]

  def sorted_highest_words
    Hash[word_count.sort_by{|k,v| v.to_i}.reverse]
  end
end
