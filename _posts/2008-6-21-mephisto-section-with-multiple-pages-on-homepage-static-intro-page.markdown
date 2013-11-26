--- 
layout: post
title: mephisto - section with multiple pages on homepage (static intro page)
tags: mephisto
---
![mephisto picture](http://www.tesoriere.com/assets/2008/6/21/Picture_3.gif "mephisto picture")

The way mephisto works, you can't have a static intro page (one article per page, a 'paged' section), and a blog in a subdirectory (ie. /journal). These options are found under the 'sections' tab.

The reason it breaks is because of the way mephisto uses permanent links. It won't prefix permanent links with the URL associated with their section. 

**There are a number of ways to fix this:**

+ sneaky template manuvering (the solution I took described below)
+ changing the way permanent links are constructed in the mephisto code-base (seemingly the proper way) and submitting a patch to include it in future revisions
+ just moving the whole mephisto installation to a subdirectory. This has it's problems because you wouldn't have access to the articles at all to slap on your introduction page. I use them to represent the 'portfolio' on this website. 

The first method is the quickest; using the templates to achieve this is fairly simple and straightforward. In your 'layout.liquid', which is the default template, you can add the following:

{% highlight bash %}
{% raw %}
{% if @section != nil %}
{% include 'home' %}
{% else %}
{% include 'journal'%}
{% endif %}
{% endraw %}
{% endhighlight %}
There also exists a '_home.liquid' and '_journal.liquid' template with however you want them to be designed. And that's it!
