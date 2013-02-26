require "is_crawler/version"

module IsCrawler
  module InstanceMethods
    def is_any_crawler?
      false
    end

    def is_crawler?(*crawlers)
      false
    end
  end
end
