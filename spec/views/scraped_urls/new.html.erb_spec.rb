require 'rails_helper'

RSpec.describe "scraped_urls/new", type: :view do
  before(:each) do
    assign(:scraped_url, ScrapedUrl.new(
      :url => "MyString",
      :word_count => ""
    ))
  end

  it "renders new scraped_url form" do
    render

    assert_select "form[action=?][method=?]", scraped_urls_path, "post" do

      assert_select "input#scraped_url_url[name=?]", "scraped_url[url]"

      assert_select "input#scraped_url_word_count[name=?]", "scraped_url[word_count]"
    end
  end
end
