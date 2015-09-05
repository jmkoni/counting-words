require 'rails_helper'

RSpec.describe "ScrapedUrls", type: :request do
  describe "GET /scraped_urls" do
    it "works! (now write some real specs)" do
      get scraped_urls_path
      expect(response).to have_http_status(200)
    end
  end
end
