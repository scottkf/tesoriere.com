--- 
layout: post
title: Migrating from mephisto to jekyll
tags: jekyll design compass 
---

## My life story: ##

Pfft, I'll save my virtual breath.

I've finally got around to moving my website (this one you're looking at!) to [Jekyll][1]. Why? Well, **lots** of reasons! But, [they](http://embrangler.com/2010/03/embrangler-moving-to-jekyll/) [have](http://hobodave.com/2010/01/08/moving-to-jekyll-disqus/) [already](http://www.sriramkrishnan.com/blog/2009/08/moving-jekyll-disqus.html) been mentioned [numerous times](http://blog.rayapps.com/2010/08/09/moving-blog-from-wordpress-com-to-jekyll/). 

However, if you don't know what [Jekyll is][1], I implore you to [visit the wiki][2] and learn about it, it's great fun if you're familiar with the terminal in osx, unix, *nix, or anything without a super fancy user interface. It lets you: 

- write your posts in Markdown or Textile (or anything you want to extend it to)
- use plain old css and html
- host your site anywhere with space, [(even mobileme)][6]
- use git or svn as a naturally way of supporting article revisions, which mephisto did beautifully (I prefer git)

## So long demon, it's been... hell. ##

I came from mephisto, [which is dead now](http://techno-weenie.net/2010/6/23/you-can-let-go-now/), but luckily [there is a way to migrate everything](http://wiki.github.com/mojombo/jekyll/blog-migrations) (except the tags :() to Jekyll. Comments also! Huzzah! The process is listed there, so I won't rehash what was said.

## Boy that sure is *a lot* of purple. ##

The design hasn't changed much, only tweaked a little. Let's face it, I'm no amazing designer, I usually hire other people for that. However, I've never found a great way to represent myself, so this will do for now. The *important* technical bit is that is uses HTML5 and CSS3 (via [compass, which is amazing][3]).

In order to maintain compatibility with older browsers, there's something called [modernizr][4], which translates HTML5 elements such as `<section>` and `<article>` into something older browsers can deal with. It really is as simple as adding this into your header:
	
{% highlight html %}
<script src="/javascripts/modernizr-1.5.min.js"></script>
{% endhighlight %}

You can view my default layout for this site on [github, right here](http://github.com/scottkf/tesoriere.com/blob/master/_layouts/default.html). I make liberal use of the newer HTML5 elements (and `<video>` should I ever need it)!
	
## Articles with name-tags are fun! ##

I had to re-tag all the articles after migrating, but I also needed a way to support /tag/something here urls. I described this process in a separate post, called [Automatically generated tags and tag clouds with Jekyll (multiple word tags allowed)][5]. I should probably fire my ghost-writer.

## Musings from the peanut gallery. ##

Comments are a tricky thing since everything is statically generated, hence that whole *"you can do this on MobileMe"* [thing][6]. But as everyone knows by now, [disqus](http://disqus.com) is a great way to implement them.

The whole process to implement them is actually a relatively easy one, you just have to use some [universal code](http://disqus.com/comments/universal) after making an account from the disqus website to add it in.

## Sending tesoriere.com to it's home. ##

Deployment is relatively easy with a rake task using rsync to send over all that data to wherever. It's really as simple as:

{%highlight bash%}
sh 'rsync -rtzh --delete _site/ #{DEPLOY_USER}@#{DEPLOY_HOST}:~/#{domain}/'
{%endhighlight%}

## Please don't steal me :( ##

You can view the [full source of this **entire site** on github](http://github.com/scottkf/tesoriere.com/tree/master)! It really only takes a couple days to do, and it's worth it if you want to try something new, simple, and I'm sure as hell my hosting company appreciates less load.

  [1]: http://github.com/mojombo/jekyll
  [2]: http://wiki.github.com/mojombo/jekyll/
  [3]: http://compass-style.org/
  [4]: http://www.modernizr.com/
  [5]: /2010/08/25/automatically-generated-tags-and-tag-clouds-with-jekyll--multiple-word-tags-allowed-/
  [6]: http://theappleblog.com/2010/08/12/how-to-blogging-with-jekyll-and-mobileme/