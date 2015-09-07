require 'rails_helper'

RSpec.describe ScrapedUrl, type: :model do
  it { should validate_uniqueness_of :url }
  describe "sort highest words" do
    let(:url) { FactoryGirl.create(:scraped_url) }

    it "should set the price_sold as $5" do
      expect(url.sorted_highest_words.first).to eq(["rainbows", "16"])
    end
  end
end
