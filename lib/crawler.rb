class Crawler < Struct.new(:name, :ua_string)
  BING      = Crawler.new(:bing, "bingbot/2.0")
  FACEBOOK  = Crawler.new(:facebook, "facebookexternalhit/1.1")
  GOOGLE    = Crawler.new(:google, "Googlebot/2.1")
  MSN       = Crawler.new(:msn, "MSNBot")
  TWITTER   = Crawler.new(:twitter, "Twitterbot")
  YAHOO     = Crawler.new(:yahoo, "Yahoo! Slurp")

  ALL = [BING, FACEBOOK, GOOGLE, MSN, TWITTER, YAHOO]

  def self.matches_any? user_agent
    ALL.detect { |crawler| crawler.matches? user_agent } != nil
  end

  def matches? user_agent
    user_agent.downcase.include? ua_string.downcase
  end
end
