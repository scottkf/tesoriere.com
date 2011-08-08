--- 
title: Migrating from Rails 3.1 RC4 to RC5 using Heroku's Cedar Stack (also compass, unicorn, and sendgrid)
layout: post
tags:
- rails
- heroku
- cedar
---

## A mouthful, indeed

I'm currently developing a super duper secret project which uses Rails 3.1 and is hosted on [Heroku][1]. With the release of Rails 3.1 RC5, I've decided to migrate to [Heroku's Cedar stack][2] after reading [Michael's article][3] about how easily unicorn can be implemented on the new stack. 

I've already migrated one app, [Wasted on Steam][4], and the performance enhancements are amazing, as you might expect. Using siege, it was able deal with 100 concurrent requests repeated 10 times in *2.5* seconds per request. Previously, it had taken *10* seconds per request. This is amazing, especially considering [Wasted on Steam][4] uses a network blocking request to update data.

For this other app, this super duper secret one, I thought I would detail the process.

## The intial setup

Currently, there's no way to migrate the stack automatically, so we have to clone and proceed:

{% highlight bash %}
git clone git@heroku.com:<your_app_name>.git cedar_testing
{% endhighlight %}

Next, create the app on the new stack:

{% highlight bash %}
heroku create --stack cedar
git config heroku.remote heroku
{% endhighlight %}


## The code changes


### Gemfile fixes

Rails 3.1.rc5 separated the asset-building gems into their own group in the Gemfile, called `:assets`, so we need to make some changes and clean it up so it looks like this:

{% highlight ruby %}
source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

group :assets do
	gem 'sass-rails', "~> 3.1.0.rc"
	gem 'coffee-rails', "~> 3.1.0.rc"
	gem 'uglifier'
	gem 'compass', '0.12.0.alpha.0.91a748a', :git => 'git://github.com/chriseppstein/compass.git', :branch => 'rails31'
end

gem 'pg'
gem "kaminari"
gem "redcarpet"
gem "devise"
gem 'sprockets'
gem "cancan"
gem "mime-types"
gem "treetop"
gem "ancestry", '>= 1.2.2'
gem "nokogiri", '1.4.4'
gem "oa-oauth", :require => "omniauth/oauth"
gem 'oa-openid', :require => 'omniauth/openid'
gem 'omniauth', '>= 0.2.6'
gem 'dalli'

group :production do
	gem 'unicorn'
end


group :development, :test do
	...
end

{% endhighlight %}

### Miscellaneous fixes

Please note, we no longer need to include the old version of rake, nor the therubyracer (the [Cedar stack][5] now includes node.js). It's very important that you update the path to use the native node.js by typing:

{% highlight bash %}
heroku config:add PATH=vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin:bin
{% endhighlight %}

Supposedly, this is supposed to happen on new apps by default, but I had issues. Now, **make sure** you run `bundle update` now to update the Gemfile!

Next, we need to update our `application.rb`; it's changed in RC5. Around line, replace with the following:

{% highlight ruby %}
Bundler.require *Rails.groups(:assets) if defined?(Bundler)
{% endhighlight %}

Now, if you're using [Compass][7] like I am, you'll need to create an initializer in `config/initializers/sass.rb`:

{% highlight ruby %}
Rails.configuration.sass.tap do |config|
  config.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
end
{% endhighlight %}

Thanks to [Ken Collins][6] for that bit! I imagine, as some point when Rails 3.1 is released this will be done automatically.

Next, in your `production.rb`, change the `config.action_dispatch.x_sendfile_header` to:

{% highlight ruby %}
config.action_dispatch.x_sendfile_header = nil
{% endhighlight %}

### If you use sendgrid

The [Cedar stack][2] is supposed to be less magical and black-boxy then the others, so if you use sendgrid, we have to accommodate for it in our `production.rb`.


{% highlight ruby %}
config.action_mailer.raise_delivery_errors = true
config.action_mailer.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN']
}
{% endhighlight %}


## Using unicorn instead of thin

### Our Procfile

This `Procfile` tells [Heroku][1] exactly which process groups need to exist for various reasons. Like a `web` group to run our unicorn. Our `Procfile` is quite simple as we only need the main web process, [Unicorn][8].

{% highlight ruby %}
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
{% endhighlight %}


### The unicorn config

Place this in your `config` directory and call it `unicorn.rb`

{% highlight ruby %}
worker_processes 4 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
{% endhighlight %}

You'll have to play around with the configuration depending on how memory-heavy your app is. [Wasted on Steam][4] uses a ton of gems and it can easily run 4 worker processes.

## Push the changes to heroku

{% highlight bash %}
git add Procfile config/unicorn.rb
git commit -a -m "Updated for Heroku and Unicorn"
git push heroku master
{% endhighlight %}


## The data

If you have any configuration variables, you'll want to go to the old app and do `heroku config -s` and migrate them over using `heroku config:add <VARIABLE>=<DATA> <HELLO>=<MOREDATA>`.

Finally, we have to pull the database from our old app. This will only work if you have the gem `taps` installed, so `gem install taps`. Go to your old app folder and type the following:

{% highlight bash %}
heroku db:pull sqlite://backup.sql
mv backup.sql ../cedar_testing
cd ../cedar_testing
heroku db:push sqlite://backup.sql
{% endhighlight %}

If you have any issues, simply type `git remote rm heroku; git remote add heroku git@heroku.com:<new_app_name>.git` then proceed with the steps above. This usually fixes everything.

## We're done!

Hopefully, everything should work now as planned. Make sure you go to `http://<yourapp>.herokuapp.com` and not `http://<yourapp>.heroku.com`, and you should see the site!
	
## Comparing performance

This app is a simple app, but to give you an idea of how it performs, again with 100 concurrent requests repeating 10 times:

### Old &amp; Busted

{% highlight bash %}
Transactions:		         995 hits
Availability:		       99.50 %
Elapsed time:		       62.90 secs
Data transferred:	        1.35 MB
Response time:		        5.26 secs
Transaction rate:	       15.82 trans/sec
Throughput:		        0.02 MB/sec
Concurrency:		       83.19
Successful transactions:         995
Failed transactions:	           5
Longest transaction:	       15.67
Shortest transaction:	        0.12
{% endhighlight %}

### New hotness

{% highlight bash %}
Transactions:		         995 hits
Availability:		       99.50 %
Elapsed time:		       62.90 secs
Data transferred:	        1.35 MB
Response time:		        5.26 secs
Transaction rate:	       15.82 trans/sec
Throughput:		        0.02 MB/sec
Concurrency:		       83.19
Successful transactions:         995
Failed transactions:	           5
Longest transaction:	       15.67
Shortest transaction:	        0.12
{% endhighlight %}


## Many articles helped get me here

[Heroku's][2] [articles][5] on migrating helped a lot. [Michael's][3] article on using unicorn on Cedar was the inspiration, and finally, [Ken's][6] article helped me get [Compass][7] integrated. Thanks!


  [1]: http://heroku.com
  [2]: http://devcenter.heroku.com/articles/cedar
  [3]: http://michaelvanrooijen.com/articles/2011/06/01-more-concurrency-on-a-single-heroku-dyno-with-the-new-celadon-cedar-stack/
  [4]: http://wastedonsteam.com
  [5]: http://devcenter.heroku.com/articles/rails31_heroku_cedar
  [6]: http://metaskills.net/2011/07/29/use-compass-sass-framework-files-with-the-rails-3.1.0.rc5-asset-pipeline/ 
  [7]: http://compass-style.org
  [8]: https://github.com/defunkt/unicorn