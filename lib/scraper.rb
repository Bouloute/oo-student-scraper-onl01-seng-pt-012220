require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped = Nokogiri::HTML(open(index_url))
    student_cards = scraped.css(".student-card")

  end

  def self.scrape_profile_page(profile_url)

  end

end
