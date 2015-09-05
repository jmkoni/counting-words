require 'rails_helper'

RSpec.describe "scraped_urls/edit", type: :view do
  before(:each) do
    @scraped_url = assign(:scraped_url, ScrapedUrl.create!(
      :url => "MyString",
      :word_count => ""
    ))
  end

  it "renders the edit scraped_url form" do
    render

    assert_select "form[action=?][method=?]", scraped_url_path(@scraped_url), "post" do

      assert_select "input#scraped_url_url[name=?]", "scraped_url[url]"

      assert_select "input#scraped_url_word_count[name=?]", "scraped_url[word_count]"
    end
  end
end
