# IsCrawler
[![Gem Version](https://badge.fury.io/rb/is_crawler.png)](http://badge.fury.io/rb/is_crawler) [![Code Climate](https://codeclimate.com/github/ccashwell/is_crawler.png)](https://codeclimate.com/github/ccashwell/is_crawler) [![Build Status](https://travis-ci.org/ccashwell/is_crawler.png?branch=master)](https://travis-ci.org/ccashwell/is_crawler)

is\_crawler does exactly what you might think it does: determine if the supplied string matches a known crawler or bot.

## Installation

Add this line to your application's Gemfile:

    gem 'is_crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_crawler

## Usage

You can use the `is_crawler?` method with just a user agent string to determine if the that string matches *any* (noteworthy) crawler, like so:

    class MyController < ActionController::Base
      include IsCrawler
      def index
        if is_any_crawler? request.env["HTTP_USER_AGENT"]
          render 'special_crawler_index'
        else
          render 'normal_boring_index'
        end
      end
    end

...or provide one or more crawlers `is_crawler?("Some User Agent/1.0", :facebook, :google)` to find out if the string matches one of those crawlers in specific. That's it!

## Contributing

Missing out on a noteworthy crawler? Find a problem? Ideas for improvement?

Raise an issue, or:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
