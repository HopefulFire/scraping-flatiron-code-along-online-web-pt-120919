require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    @courses = get_page.css(".post")
  end

  def make_courses
    get_courses.each do |course|
      title = course.css("h2").text
      schedule = course.css(".date").text
      description = course.css("p").text
      course = {title: title, schedule: schedule, description: description}
      Course.new(course)
    end
  end

end



