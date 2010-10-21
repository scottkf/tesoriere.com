--- 
layout: post
title: Cucumber, capybara, lightboxes, and you
tags:
- quicktip
- cucumber
- capybara
---

Selenium wasn't playing very nice with lightboxes during one of my tests, it just said _it wasn't visible_! Thanks! That helps all you have to do is wait silly:

{% highlight gherkin %}
When I wait until I can see "new_category"
{% endhighlight %}

And the step definition:
{% highlight ruby %}
When /^I wait until I can see "([^"]*)"$/ do |selector|
  page.has_css?("#{selector}", :visible => true)
end
{% endhighlight %}
