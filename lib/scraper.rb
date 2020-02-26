require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    scraped = Nokogiri::HTML(open(index_url))
    student_cards = scraped.css(".student-card")

    student_cards.each {|student|
      student_data = {}
      student_data[:name] = student.css(".student-name").text
      student_data[:location] = student.css(".student-location").text
      student_data[:profile_url ] = student.css("a").attribute("href").value
      students.push(student_data)
    }
    students
  end

  def self.scrape_profile_page(profile_url)
    student = Nokogiri::HTML(open(profile_url))

    student_data = {}
    student_data[:bio] = student.css(".description-holder").css("p").text
    student_data[:profile_quote] = student.css(".profile-quote").text
    #student_data[:blog] = student.css(".profile-quote").text

    binding.pry
    student.css("social-icon-container").each do |social|
      if social.attribute("href").value.include?("twitter")
        student_profile[:twitter] = social.attribute("href").value
      elsif social.attribute("href").value.include?("linkedin")
        student_profile[:linkedin] = social.attribute("href").value
      elsif social.attribute("href").value.include?("github")
        student_profile[:github] = social.attribute("href").value
      else
        student_profile[:blog] = social.attribute("href").value
      end
    end
    student_data
  end

end
