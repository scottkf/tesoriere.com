--- 
layout: post
title: embed a mobileme gallery in a design, on any website
tags: 
- mobileme 
- osx
---
<img src="http://tesoriere.com/images/assets/2009/4/12/mobileme.png" style="height:80px;width:auto;float:right;margin-left:10px" /> On the right there's a new link for 'pictures', I'm embedding a mobileme gallery within the frame of the extremely wide tesoriere.com layout. It's not thaaaat terrible, but honestly, don't most people use facebook now?<br /><br />

The relevant code is simple, and can be found through iWeb, but to save you the trouble:

{% highlight html %}
<iframe src="http://gallery.me.com/<username>" frameborder="0" scrolling="no">
</iframe>
{% endhighlight %}

You have to give it a big enough frame [w:855px,h:630px], or allow it to scroll. 

PS. It's also hosted on MobileMe with a CNAME pointing to web.me.com from me.tesoriere.com.




