require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    scraped = Nokogiri::HTML(open(index_url))
    student_cards = scraped.css(".student-card")
    #student_cards[0].css(".student-name").text == "Ryan Johnson"
    student_cards.each {|student|
      student_data = {}
      student_data[:name] = student.css(".student-name").text
      student_data[:location] = student.css(".student-location").text
      student_data[:profile_url ] = student_cards[0].css("a").attribute("href").value
      students.push(student_data)
    }
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
