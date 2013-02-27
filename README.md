# IsCrawler

is\_crawler does exactly what you might think it does: determine if the current request is coming from a crawler or bot.

## Installation

Add this line to your application's Gemfile:

    gem 'is_crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_crawler

## Usage

You can use the `is_any_crawler?` method to determine if the given string, as you might have guessed, matches *any* (noteworthy) crawler, like so:

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

...or the `is_crawler?("Some User Agent/1.0", :facebook, :google)` methods to determine if you're dealing with one or more specific crawlers. That's it!

## Contributing

Missing out on a noteworthy crawler? Find a problem? Ideas for improvement?

Raise an issue, or:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
