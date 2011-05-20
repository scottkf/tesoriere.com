--- 
layout: post
title: Rails 3.1 &#8212; Testing with remote XML/HTML using Nokogiri, stubs, and rspec
tags:
- rails
- bdd
- mocks & stubs
---

## So you're pulling remote data, woo!

I suppose this works in Rails 3.x, but, in order to not be a burden on the server you're grabbing the data from, it would be nice to not have to grab the data each and EVERY time you have to run the unit tests, so you have to mock Nokogiri, but how. It's quite simple, assuming you're using Nokogiri like this: `doc = Nokogiri::XML(open("http://tesoriere.com?xml=1"))`. In your unit test, all you have to do is mock the parse function and you're done!

{% highlight ruby %}
doc = Nokogiri::XML(open(Rails.root + 'spec/support/tesoriere.xml'))
Nokogiri::XML::Document.stub!(:parse)
Nokogiri::XML::Document.should_receive(:parse).and_return(doc)
{%endhighlight%}