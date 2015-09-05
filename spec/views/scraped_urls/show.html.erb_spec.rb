require 'rails_helper'

RSpec.describe "scraped_urls/show", type: :view do
  before(:each) do
    @scraped_url = assign(:scraped_url, ScrapedUrl.create!(
      :url => "Url",
      :word_count => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
