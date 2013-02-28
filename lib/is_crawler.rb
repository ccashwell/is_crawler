require './lib/is_crawler/version'
require './lib/crawler'

module IsCrawler
  def is_any_crawler? requesting_user_agent
    Crawler.matches_any? requesting_user_agent
  end

  def is_crawler? requesting_user_agent, *specific_crawlers
    crawler = which_crawler(requesting_user_agent)
    crawler && specific_crawlers.include?(crawler.name) ? true : false
  end

  def which_crawler requesting_user_agent
    Crawler.all.detect {|crawler| crawler.matches? requesting_user_agent }
  end
end
