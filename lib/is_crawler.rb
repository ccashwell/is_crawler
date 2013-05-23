require 'crawler'

module IsCrawler
  VERSION = "0.1.5"

  def is_crawler? requesting_user_agent, *specific_crawlers
    if specific_crawlers && specific_crawlers.size > 0
      specific_crawlers.include?(Crawler.which_crawler(requesting_user_agent))
    else
      Crawler.matches_any?(requesting_user_agent)
    end
  end

  Crawler.all.each do |crawler|
    define_method "is_#{crawler.name.to_s}_crawler?" do |requesting_user_agent|
      is_crawler? requesting_user_agent, crawler.name
    end
  end
end
