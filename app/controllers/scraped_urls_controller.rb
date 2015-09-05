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
    @scraped_url = ScrapedUrl.new(scraped_url_params)
    page = Nokogiri::HTML(open(@scraped_url.url))
    page.xpath("//style").remove
    page.xpath("//script").remove
    text = page.text.gsub(/[^0-9a-z ]/i, '').split(" ")
    counted_words = text.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
    @scraped_url.word_count = counted_words.to_a[0..9].to_h

    if @scraped_url.save
      redirect_to @scraped_url, notice: 'Scraped url was successfully created.'
    else
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def scraped_url_params
      params.require(:scraped_url).permit(:url, :word_count)
    end
end
