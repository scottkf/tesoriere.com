--- 
layout: post
title: mephisto next article link, and previous article link
tags: mephisto
---
8.2 either removed the two functions I used to manage article navigation at the bottom (move your eyes dowwwwn just above the comments), or I added them and thought they came for free. After looking at the <a href="http://github.com/emk/mephisto/tree/0535b5ff99d45c94e6cb5d54d8ddaf24081840bd/app/drops">date in the master repo</a> the latter appears to be true!

{% highlight ruby %}
#article_drop.rb

## this goes in app/drops/article_drop.rb
def next?
  !@source.next.blank?
end

def previous?
  !@source.previous.blank?
end
{% endhighlight %}
Then to use it, go to your liquid template and add the following somewhere important:


{% highlight html %}
#previous link
{{ "{% if article.previous? " }}%}
  {{ "{{article | previous_article | link_to_article " }}}}
{{ "{% else " }}%}
  <a href="/">home</a>
{{ "{% endif " }}%}

#next link
{{ "{% if article.next? " }}%}
{{ "{{article | next_article | link_to_article " }}}}
{{ "{% else " }}%}
  <a href="/">home</a>
{{ "{% endif " }}%}

{% endhighlight %}

If you want the links to have different text, say next/previous, you need to change the previous like so

{% highlight html %}
#previous link
{{ "{% if article.previous? " }}%}
  {{ "{{article | previous_article | link_to_article: 'PREVIOUS' " }}}}
{{ "{% else " }}%}
  <a href="/">home</a>
{{ "{% endif " }}%}

#next link
{{ "{% if article.next? " }}%}
{{ "{{article | next_article | link_to_article: 'NEXT' " }}}}
{{ "{% else " }}%}
  <a href="/">home</a>
{{ "{% endif " }}%}
{% endhighlight %}


It would appear that the prev/next_article filters check to see if one exists, but I prefer to link back to home for usability purposes, and this lets me do that.
