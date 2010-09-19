--- 
layout: post
title: Highlighting liquid code in a liquid template with Jekyll (Escape a liquid templating tag)
tags: liquid jekyll
---

This is a somewhat confusing thing to achieve, highlighting [liquid templating code][1] in a code block, and made even more confusing by the title. Take this example from [this article about I wrote about mephisto][2]:

{% highlight html %}
#previous link
{{ "{% if article.previous? " }}%}
  {{ "{{article | previous_article | link_to_article " }}}}
{{ "{% else " }}%}
  <a href="/">home</a>
{{ "{% endif " }}%}

{% endhighlight %}


To actually display the liquid template code you have to get crazy with the curly brackets; the code in the markdown (in my case) file actually looks like:

{%highlight html%}
#previous link
{{ "{{ “{% if article.previous? “" }}}}%}
	{{ "{{ “{{article | previous_article | link_to_article  “" }}}}}}
{{ "{{ “{% else “" }}}}%}
  <a href="/">home</a>
{{ "{{ “{% endif “" }}}}%}
{% endhighlight %}


Typing that above leads to a sweet infinity effect, but do yourself a favor and don't copy/paste that, just [take it from this post on github][3], because to actually type that I had to use `&ldquo;`. Of course a *proper* way to do would be to extend markdown/textile in pygments to support the liquid templating language, but that's for another day.



  [1]: http://liquidmarkup.org/
  [2]: /2009/04/17/mephisto-next-article-link-and-previous-article-link/
  [3]: http://github.com/scottkf/tesoriere.com/blob/master/_posts/2010-08-25-liquid-code-in-a-liquid-template-with-jekyll.markdown#L9-17

