require 'nokogiri'
require 'open-uri'

class ScrapedUrlsController < ApplicationController

  # GET /scraped_urls
  def index
    @scraped_urls = ScrapedUrl.all
  end

  # GET /scraped_urls/1
  def show
    @scraped_url = ScrapedUrl.find(params[:id])
  end

  # GET /scraped_urls/new
  def new
    @scraped_url = ScrapedUrl.new
  end

  # POST /scraped_urls
  def create
    url = scraped_url_params[:url]
    if url.blank?
      # @scraped_url = ScrapedUrl.new
      redirect_to new_scraped_url_path, alert: 'Please enter a URL.'
    else
      @scraped_url = ScrapedUrl.find_by_url(url)
      if @scraped_url
        redirect_to @scraped_url, notice: 'This URL was previously scraped.'
      else
        @scraped_url = ScrapedUrl.new
        @scraped_url.url = url
        begin
          @scraped_url.word_count = get_top_words_from_url(url)
          if @scraped_url.save
            redirect_to @scraped_url, notice: 'URL has been scraped.'
          else
            render :new
          end
        rescue
          redirect_to new_scraped_url_path, alert: "URL: #{url} is not valid. Please enter a valid URL, including the http://."
        end
      end
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def scraped_url_params
      params.require(:scraped_url).permit(:url)
    end

    def get_top_words_from_url(url)
      page = Nokogiri::HTML(open(url))
      page.xpath("//style").remove
      page.xpath("//script").remove
      text = page.text.downcase.gsub(/[^a-z ]/i, '').split(" ")
      counted_words = text.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
      counted_words.delete_if { |key, _| ScrapedUrl::COMMON_WORDS.to_set.include? key }
      Hash[counted_words.sort_by{|k,v| v}.last(10).reverse]
    end
end
