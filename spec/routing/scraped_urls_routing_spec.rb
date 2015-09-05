require "rails_helper"

RSpec.describe ScrapedUrlsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scraped_urls").to route_to("scraped_urls#index")
    end

    it "routes to #new" do
      expect(:get => "/scraped_urls/new").to route_to("scraped_urls#new")
    end

    it "routes to #show" do
      expect(:get => "/scraped_urls/1").to route_to("scraped_urls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scraped_urls/1/edit").to route_to("scraped_urls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scraped_urls").to route_to("scraped_urls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scraped_urls/1").to route_to("scraped_urls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scraped_urls/1").to route_to("scraped_urls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scraped_urls/1").to route_to("scraped_urls#destroy", :id => "1")
    end

  end
end
