class Crawler < Struct.new(:name, :ua_string)
  class << self
    def all
      [
        Crawler.new(:addthis, "AddThis.com"),
        Crawler.new(:alexa, "ia_archiver"),
        Crawler.new(:archive_org, "archive.org_bot"),
        Crawler.new(:bing, "bingbot"),
        Crawler.new(:bitly, "bitlybot"),
        Crawler.new(:exabot, "Exabot"),
        Crawler.new(:facebook, "facebookexternalhit"),
        Crawler.new(:flipboard, "FlipboardProxy"),
        Crawler.new(:google, "Googlebot"),
        Crawler.new(:google_web_preview, "Google Web Preview"),
        Crawler.new(:msn, "MSNBot"),
        Crawler.new(:openwebspider, "OpenWebSpider"),
        Crawler.new(:technorati, "Technoratibot"),
        Crawler.new(:twitter, "Twitterbot"),
        Crawler.new(:yahoo, "Yahoo! Slurp"),
        Crawler.new(:yahoo_jp, "Y!J"),
        Crawler.new(:yandex, "Yandex")
      ]
    end

    def matches_any? user_agent
      all.detect { |crawler| crawler.matches? user_agent } != nil
    end

    def which_crawler user_agent
      all.detect {|crawler| crawler.matches? user_agent }.name rescue nil
    end
  end

  def matches? user_agent
    user_agent.downcase.include? ua_string.downcase
  end
end
