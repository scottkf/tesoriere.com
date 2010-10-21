--- 
layout: post
title: Cucumber, capybara, and checking for the existence of selected options within a select box
tags:
- quicktip
- cucumber
- capybara
---

Checking for a selected option within Cucumber/Capaybara is quite simple:

{% highlight gherkin %}
Then "hello" should be selected for "article_category_id"
{% endhighlight %}

And the step definition:
{% highlight ruby %}
Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), value)]") 
end
{% endhighlight %}

You could easily extrapolate this for use within an unselected value, just by removing the selected bit:

{% highlight ruby %}
Then /^"([^"]*)" should be seen within "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[contains(string(), value)]") 
end
{% endhighlight %}

