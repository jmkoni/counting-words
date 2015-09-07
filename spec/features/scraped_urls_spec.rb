require "rails_helper"

describe "add new scraped_url" do

  describe "scraped_urls index", type: :feature do

    describe "see previous scraped urls" do

      let!(:scraped_url_1) { FactoryGirl.create(:scraped_url, url: 'http://ponyparty.com') }
      let!(:scraped_url_2) { FactoryGirl.create(:scraped_url, url: 'http://doublerainbow.com') }

      it "displays a list of all past clearance batches" do
        visit "/"
        expect(page).to have_content("Counting Words")
        # expect(page).to have_content("Clearance Batches")
        within('table.scraped_urls') do
          expect(page).to have_content("http://doublerainbow.com")
          expect(page).to have_content("http://ponyparty.com")
        end
      end

    end

    describe "add a new url" do

      context "total success" do

        it "should allow a user to add a new url successfully" do
          visit "/scraped_urls/new"
          expect(page).to have_content("Enter new URL to scrape")
          fill_in("scraped_url_url", with: "spec/features/sample.html")
          click_button "Create Scraped url"
          new_url = ScrapedUrl.first
          expect(page).to have_content("URL has been scraped.")
          expect(page).to have_content("python: 3")
          expect(page).to have_content("boston: 2")
        end

      end

      context "previously added" do
        it "should not allow a user to add one that has previously been added" do
          scraped_url1 = FactoryGirl.create(:scraped_url, url: 'spec/features/sample.html')
          visit "/scraped_urls/new"
          expect(page).to have_content("Enter new URL to scrape")
          fill_in("scraped_url_url", with: "spec/features/sample.html")
          click_button "Create Scraped url"
          new_url = ScrapedUrl.first
          expect(page).to have_content("This URL was previously scraped.")
          expect(page).to have_content("rainbows: 16")
          expect(page).to have_content("unicorns: 10")
        end
      end

      context "total failure" do

        it "should error correctly when URL is not valid" do
          visit "/scraped_urls/new"
          expect(page).to have_content("Enter new URL to scrape")
          fill_in("scraped_url_url", with: "test.com")
          click_button "Create Scraped url"
          expect(page).to have_content("URL: test.com is not valid. Please enter a valid URL, including the http://.")
          expect(page).to have_content("Enter new URL to scrape")
        end
      end

      context "no url added" do

        it "should give user error message when url is input" do
          visit "/scraped_urls/new"
          expect(page).to have_content("Enter new URL to scrape")
          fill_in("scraped_url_url", with: "")
          click_button "Create Scraped url"
          expect(page).to have_content("Please enter a URL.")
          expect(page).to have_content("Enter new URL to scrape")
        end
      end
    end
  end

  describe "scraped_urls show", type: :feature do
    it "should allow the user to see top 10 words in a scraped url" do
      scraped_url_1 = FactoryGirl.create(:scraped_url)
      visit "/scraped_urls/#{ScrapedUrl.first.id}"
      expect(page).to have_content(ScrapedUrl.first.url)
      expect(page).to have_content("rainbows: 16 unicorns: 10 ponies: 4")
    end
  end
end
