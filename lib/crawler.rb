require 'yaml'

class Crawler < Struct.new(:name, :ua_string)
  DEFAULT = YAML.load(File.read(File.expand_path('../config/crawlers.yml', __FILE__))).collect do |k,v|
    Crawler.new(k.to_sym, v["ua_string"])
  end

  CUSTOM = []

  class << self
    def all
      DEFAULT + CUSTOM
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
