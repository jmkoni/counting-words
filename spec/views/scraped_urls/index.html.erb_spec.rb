require 'rails_helper'

RSpec.describe "scraped_urls/index", type: :view do
  before(:each) do
    assign(:scraped_urls, [
      ScrapedUrl.create!(
        :url => "Url",
        :word_count => ""
      ),
      ScrapedUrl.create!(
        :url => "Url",
        :word_count => ""
      )
    ])
  end

  it "renders a list of scraped_urls" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
