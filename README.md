# IsCrawler

is\_crawler does exactly what you might think it does: determine if the current request is coming from a crawler or bot.

It includes `is_any_crawler?` methods into `ActionController::Base`, so it is always available with any request.

## Installation

Add this line to your application's Gemfile:

    gem 'is_crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_crawler

## Usage

You can use the `is_any_crawler?` method to determine if the request came from, as you might have guessed, *any* (noteworthy) crawler, like so:

    class MyController < ActionController::Base
      def index
        if is_any_crawler?
          render 'special_crawler_index'
        else
          render 'normal_boring_index'
        end
      end
    end

...or the `is_crawler?(:facebook, :google)` methods to determine if you're dealing with one or more specific crawlers. That's it!

## Contributing

Missing out on a noteworthy crawler? Find a problem? Ideas for improvement? 

Raise an issue, or:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
