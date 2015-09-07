FactoryGirl.define do

  factory :scraped_url do
    url 'http://test.com'
    word_count {{"ponies" => "4", "unicorns" => "10", "rainbows" => "16"}}
  end
end
