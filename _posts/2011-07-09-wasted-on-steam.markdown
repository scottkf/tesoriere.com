--- 
layout: post
title: Wasted on Steam - an analytic tool for the Steam platform
tags:
- steam
- rails
- portfolio
img: wastedonsteam.png
---
![Wasted on Steam](http://tesoriere.com/images/assets/2011/wastedonsteam.png "Wasted on Steam")

## I was always curious...

[Steam][1] has existed for about 8 years now, and I was always curious how much time and money I've <strike>wasted</strike> spent with the service. I created a webapp to calculate how many hours have been spent as well as an approximate cost of an account's worth. There are gaps in steam's data, so it's not entirely accurate, but it's a good estimate.

## What's it made out of?

It's built using Rails 3.1, which was the other main motivator for creating this - testing out the new assets pipeline in Rails 3.1. It's hosted on [heroku][2], uses gruff to make simple price graphs, nokogiri to update the data, the money class to store the prices, and delayed_job to push all the updating into the background.

The gemfile is below:

{% highlight ruby %}
gem 'rails', '3.1.0.rc4'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'attempt'
gem 'gruff', :require => false
gem 'rmagick', :require => false
gem 'nokogiri', '1.4.4'
gem 'sprockets', '> 2.0.0.beta.2'
gem 'compass', :git => "https://github.com/chriseppstein/compass.git"
gem 'jquery-rails'
gem 'money'
gem 'steam-prices', :git => "https://github.com/scottkf/steam-prices.git"
gem 'linguistics'
gem 'redcarpet'
gem 'kaminari'
gem 'devise'
gem 'dalli'
gem 'delayed_job'

group :production do
	gem 'hirefire'
end

{% endhighlight %}



[1]: http://steampowered.com
[2]: http://heroku.com