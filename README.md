# is_crawler [![Gem Version](https://badge.fury.io/rb/is_crawler.png)](http://badge.fury.io/rb/is_crawler) [![Build Status](https://travis-ci.org/ccashwell/is_crawler.png?branch=master)](https://travis-ci.org/ccashwell/is_crawler) [![Code Climate](https://codeclimate.com/github/ccashwell/is_crawler.png)](https://codeclimate.com/github/ccashwell/is_crawler)

This gem does one thing: determine if the supplied string matches a known crawler or bot. It matches against a very short list of strings found in the user agents that represent over 95% of crawler traffic. IMO, if it ain't detected, it ain't important.

## Installation

Add this line to your application's Gemfile:

    gem 'is_crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_crawler

## Usage

You can use the `is_crawler?` method with just a user agent string to determine if it matches *any* crawler, like so:

    class MyController < ActionController::Base
      include IsCrawler
      def index
        if is_crawler? request.env["HTTP_USER_AGENT"]
          render 'special_crawler_index'
        else
          render 'normal_boring_index'
        end
      end
    end

...or provide one or more crawlers to find out if the string matches *specific* crawlers: 

    is_crawler?("Some User Agent/1.0", :facebook, :google)

...or you can use the method sugar:

    is_facebook_crawler? request.env["HTTP_USER_AGENT"]

...and you can add to the list of detectables:

    Crawler::CUSTOM << Crawler.new(:custom_crawler_name, "string that is always present in the crawler's user agent")

That's it!

## Contributing

Missing out on a noteworthy crawler? Find a problem? Ideas for improvement?

Raise an issue, or:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
