require "is_crawler/version"

module IsCrawler
  module InstanceMethods
    def is_any_crawler?
      raise NotImplementedError
    end

    def is_crawler?(*crawlers)
      raise NotImplementedError
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include IsCrawler::InstanceMethods
  end
end
