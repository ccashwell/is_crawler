require './lib/is_crawler/version'
require './lib/crawler'

module IsCrawler
  def is_crawler? requesting_user_agent, *specific_crawlers
    if specific_crawlers && specific_crawlers.size > 0
      specific_crawlers.include?(Crawler.which_crawler(requesting_user_agent))
    else
      Crawler.matches_any?(requesting_user_agent) unless specific_crawlers.size > 0
    end
  end
end
