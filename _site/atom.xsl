<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>Scott Tesoriere</title>
	<link href="http://tesoriere.com/atom.xml" rel="self"/>
	<link href="http://tesoriere.com/"/>
	<updated>2010-08-24T14:25:16-04:00</updated>
	<id>http://tesoriere.com</id>
	<author>
		<name>Scott Tesoriere</name>
		<email>scott@tesoriere.com</email>
	</author>
	
	<entry>
		<title>GTX470/480 (Fermi) in OSX</title>
		<link href="http://tesoriere.com/2010/06/21/gtx470-480-fermi-in-osx/"/>
		<updated>2010-06-21T00:00:00-04:00</updated>
		<id>http://cartera.me/2010/06/21/gtx470-480-fermi-in-osx</id>
		<content type="html">&lt;p&gt;This may or not be relevant to you, but it's interesting. How to use a GTX470/480/465/480M in OSX.&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;http://www.insanelymac.com/forum/index.php?showtopic=214219&quot;&gt;http://www.insanelymac.com/forum/index.php?showtopic=214219&lt;/a&gt;&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Premier Medical Care</title>
		<link href="http://tesoriere.com/2009/10/13/premier-medical-care/"/>
		<updated>2009-10-13T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/10/13/premier-medical-care</id>
		<content type="html">&lt;p&gt;&lt;a href=&quot;http://tesoriere.com/assets/2009/10/14/Screen_shot_2009-10-14_at_9.21.40_AM.png&quot; rel=&quot;lightbox&quot;&gt;&lt;img alt=&quot;premier medical care picture&quot; title=&quot;project picture&quot; src=&quot;http://tesoriere.com/assets/2009/10/14/Screen_shot_2009-10-14_at_9.21.40_AM.png&quot;&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;Premier Medical Care's new website, he also happens to be my physician. &lt;a href=&quot;http://premiermedicalcarepb.com&quot;&gt;http://premiermedicalcarepb.com&lt;/a&gt;.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Cloning an ISO to a USB flash drive (or anywhere) using DD in Snow Leopard 10.6 with a progress-ish meter</title>
		<link href="http://tesoriere.com/2009/08/31/cloning-an-iso-to-a-usb-flash-drive-or-anywhere-using-dd-in-snow-leopard-10-6-with-a-progress-meter-of-sorts/"/>
		<updated>2009-08-31T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/08/31/cloning-an-iso-to-a-usb-flash-drive-or-anywhere-using-dd-in-snow-leopard-10-6-with-a-progress-meter-of-sorts</id>
		<content type="html">&lt;p&gt;Oh, and Leopard too.&lt;/p&gt;

&lt;p&gt;What a title. I recently needed to use G-Parted, but didn't have any blank disc's laying around, and the method they describe on the &lt;a href=&quot;http://gparted.sourceforge.net/liveusb.php&quot;&gt;gparted wiki&lt;/a&gt; to do this with a USB disk doesn't work on OSX. So, I used &lt;a href=&quot;http://en.wikipedia.org/wiki/Dd_(Unix)&quot;&gt;DD&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;Open up terminal (from Applications/Utilities or use Spotlight) and type what follows &lt;em&gt;substituting as necessary&lt;/em&gt;. My USB device was located at /dev/disk3. You can find the device name in Disk Utility by right-clicking on the device, and choosing 'information'.&lt;/p&gt;

&lt;p&gt;&lt;b&gt;THIS WILL OVERWRITE WHATEVER'S ON THE DISK&lt;/b&gt;.&lt;/p&gt;

&lt;div class=&quot;highlight&quot;&gt;&lt;pre&gt;&lt;code class=&quot;bash&quot;&gt;sudo dd &lt;span class=&quot;k&quot;&gt;if&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;=&lt;/span&gt;/path/to/iso.iso.dmg.img &lt;span class=&quot;nv&quot;&gt;of&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;=&lt;/span&gt;/dev/disk3 &lt;span class=&quot;nv&quot;&gt;bs&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;=&lt;/span&gt;1024
&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;


&lt;p&gt;And voila, you have a &lt;em&gt;read-only&lt;/em&gt; replica of the iso on your usb device. Please note the emphasis on &lt;em&gt;read-only&lt;/em&gt; in the case of an ISO.&lt;/p&gt;

&lt;p&gt;To see a progress bar (of sorts), open up a new terminal window and type the following&lt;/p&gt;

&lt;div class=&quot;highlight&quot;&gt;&lt;pre&gt;&lt;code class=&quot;bash&quot;&gt;ps auxww | grep &lt;span class=&quot;s2&quot;&gt;&amp;quot; dd &amp;quot;&lt;/span&gt; | grep -v grep | awk &lt;span class=&quot;s1&quot;&gt;&amp;#39;{print $2}&amp;#39;&lt;/span&gt; | &lt;span class=&quot;k&quot;&gt;while &lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;read &lt;/span&gt;pid; &lt;span class=&quot;k&quot;&gt;do &lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;kill&lt;/span&gt; -SIGINFO &lt;span class=&quot;nv&quot;&gt;$pid&lt;/span&gt;; &lt;span class=&quot;k&quot;&gt;done&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;


&lt;p&gt;I originally got the progress bit from &lt;a href=&quot;http://www.kclug.org/wiki/index.php/Dd_progress&quot;&gt;here&lt;/a&gt;, but changed it to work with OSX.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Using a 3.0 iPhone on T-Mobile? Get MMS Working!</title>
		<link href="http://tesoriere.com/2009/06/16/using-a-3-0-iphone-on-t-mobile-get-mms-working/"/>
		<updated>2009-06-16T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/06/16/using-a-3-0-iphone-on-t-mobile-get-mms-working</id>
		<content type="html">&lt;p&gt;&lt;a href=&quot;http://tesoriere.com/assets/2009/6/17/web.jpg&quot; rel=&quot;lightbox&quot;&gt;&lt;img src=&quot;http://tesoriere.com/assets/2009/6/17/web.jpg&quot; alt=&quot;settings&quot; style=&quot;width: 150px; height: auto; float: right; margin-left: 10px&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;I am, and have been. T-Mobile's customer service is beyond amazing.&lt;/p&gt;

&lt;p&gt;Go to settings -&gt; general -&gt; network -&gt; cellular data&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;APN: wap.voicestream.com&lt;/li&gt;
&lt;li&gt;MMSC: 216.155.174.84/servlets/mms&lt;/li&gt;
&lt;li&gt;MMS Proxy: 216.155.165.50:8080&lt;/li&gt;
&lt;li&gt;Username: leave empty&lt;/li&gt;
&lt;li&gt;Password: leave empty&lt;/li&gt;
&lt;/ul&gt;


&lt;p&gt;Click the picture --^ to see how it looks on the phone.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Keep Flippin' website v3</title>
		<link href="http://tesoriere.com/2009/06/15/keep-flippin-website-redone/"/>
		<updated>2009-06-15T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/06/15/keep-flippin-website-redone</id>
		<content type="html">&lt;p&gt;&lt;a href=&quot;http://tesoriere.com/assets/2009/6/15/Picture_1.png&quot; rel=&quot;lightbox&quot;&gt;&lt;img alt=&quot;keep flippin picture&quot; title=&quot;project picture&quot; src=&quot;http://tesoriere.com/assets/2009/6/15/Picture_1.png&quot;&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;b&gt;Below this is all tech-talk.&lt;/b&gt; To summarize, I used new stuff to make the site better, make it quicker, and more responsive. &lt;a href=&quot;http://keepflippin.com&quot;&gt;This is what I made.&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;In every project I do, I like to learn something new. This time, I just happened to learn quite a few new things, &lt;a href=&quot;http://haml.hamptoncatlin.com/docs/rdoc/classes/Sass.html&quot;&gt;SASS&lt;/a&gt;, &lt;a href=&quot;http://www.w3.org/TR/xslt&quot;&gt;XSLT&lt;/a&gt;, and additional knowledge about PHP to name a few. Not that PHP is still anything amazing, but it can't hurt to renew some knowledge of it.&lt;/p&gt;

&lt;p&gt;The &lt;a href=&quot;http://keepflippin.com&quot;&gt;new keep flippin website&lt;/a&gt; is built using &lt;a href=&quot;http://compass-style.org/&quot;&gt;compass&lt;/a&gt; for the CSS (this is &lt;em&gt;amazing&lt;/em&gt;), &lt;a href=&quot;http://symphony-cms.com&quot;&gt;symphony&lt;/a&gt;, some &lt;a href=&quot;http://tesoriere.com/tags/symphony%20extension&quot;&gt;extensions I created&lt;/a&gt; and &lt;a href=&quot;http://github.com/scottkf&quot;&gt;GitHub&lt;/a&gt; to keep track of everything.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>I know I've been living under a rock</title>
		<link href="http://tesoriere.com/2009/06/14/i-know-i-ve-been-living-under-a-rock/"/>
		<updated>2009-06-14T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/06/14/i-know-i-ve-been-living-under-a-rock</id>
		<content type="html">&lt;p&gt;But have you seen &lt;a href=&quot;http://wiki.github.com/mojombo/jekyll/install&quot;&gt;jekyll&lt;/a&gt;?. It makes blogging seem like it might be fun. I bet the people at my hosting company would appreciate it too.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Dealing with database concurrency (locking) in the Symphony CMS</title>
		<link href="http://tesoriere.com/2009/06/13/dealing-with-database-concurrency-locking-in-the-symphony-cms/"/>
		<updated>2009-06-13T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/06/13/dealing-with-database-concurrency-locking-in-the-symphony-cms</id>
		<content type="html">&lt;p&gt;&lt;img src=&quot;http://tesoriere.com/assets/2009/6/14/Picture_1.png&quot; alt=&quot;picture of it&quot; /&gt;&lt;/p&gt;

&lt;p&gt;Symphony doesn't natively supported &lt;a href=&quot;http://www.google.com/search?q=pessimistic+database+locking&quot;&gt;pessimistic database locking&lt;/a&gt;, so I created an extension in symphony to handle it, both in the backend and the frontend. It's somewhat complicated to implement, but so far it works pretty great. I created it because one of the next big projects I'm working on will be used by many people at once, and I was considering using symphony to create it, as opposed to Rails.&lt;/p&gt;

&lt;p&gt;You can get it &lt;a href=&quot;https://github.com/scottkf/pessimistic-db-locking/tree&quot;&gt;here&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;Report any issues at &lt;a href=&quot;https://github.com/scottkf/pessimistic-db-locking/issues&quot;&gt;GitHub&lt;/a&gt;.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Uploading multiple files with Symphony CMS</title>
		<link href="http://tesoriere.com/2009/06/01/uploading-multiple-files-with-symphony-cms/"/>
		<updated>2009-06-01T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/06/01/uploading-multiple-files-with-symphony-cms</id>
		<content type="html">&lt;p&gt;&lt;img src=&quot;http://tesoriere.com/assets/2009/6/2/Picture_1.png&quot; title=&quot;mass upload utility&quot; alt=&quot;Mass Upload Utility&quot; /&gt;&lt;/p&gt;

&lt;p&gt;Many CMS' don't offer a way to manage picture galleries easily, and neither does symphony out of the box. But, after playing with symphony some, I decided that I liked it and the next project I would do would be with symphony.&lt;/p&gt;

&lt;p&gt;So I created a plugin (in symphony: extension) that allows you to upload multiple files, and create entries (in this example, gallery items, or rows in the database, etc) to allow you to accomplish this easily.&lt;/p&gt;

&lt;p&gt;You can download it at &lt;a href=&quot;http://github.com/scottkf/mass-upload-utility/tree/master&quot;&gt;Github&lt;/a&gt;.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>Symphony CMS</title>
		<link href="http://tesoriere.com/2009/05/28/symphony-cms/"/>
		<updated>2009-05-28T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/05/28/symphony-cms</id>
		<content type="html">&lt;p&gt;&lt;img src=&quot;http://tesoriere.com/assets/2009/5/29/kf.jpg&quot; /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;

&lt;p&gt;I've been working on moving &lt;a href=&quot;http://keepflippin.com&quot;&gt;this&lt;/a&gt; to &lt;a href=&quot;http://symphony-cms.com&quot;&gt;this&lt;/a&gt;. It's got a bit of a learning curve, but I would say it's like Rails for designers with a GUI. That's not a bad thing. The bad thing is that it uses &lt;a href=&quot;http://www.w3.org/TR/xslt&quot;&gt;XSLT 1.0&lt;/a&gt;. Which is the least powerful language ever written (spec was written 8 years ago). It's not a procedural language, and if you don't treat it as one, you'll be ok.&lt;/p&gt;

&lt;p&gt;Some posts about tutorials will follow.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>mephisto next article link, and previous article link</title>
		<link href="http://tesoriere.com/2009/04/17/mephisto-next-article-link-and-previous-article-link/"/>
		<updated>2009-04-17T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/04/17/mephisto-next-article-link-and-previous-article-link</id>
		<content type="html">&lt;p&gt;8.2 either removed the two functions I used to manage article navigation at the bottom (move your eyes dowwwwn just above the comments), or I added them and thought they came for free. After looking at the &lt;a href=&quot;http://github.com/emk/mephisto/tree/0535b5ff99d45c94e6cb5d54d8ddaf24081840bd/app/drops&quot;&gt;date in the master repo&lt;/a&gt; the latter appears to be true!&lt;/p&gt;

&lt;div class=&quot;highlight&quot;&gt;&lt;pre&gt;&lt;code class=&quot;ruby&quot;&gt;&lt;span class=&quot;c1&quot;&gt;#article_drop.rb&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;## this goes in app/drops/article_drop.rb&lt;/span&gt;
&lt;span class=&quot;k&quot;&gt;def&lt;/span&gt; &lt;span class=&quot;nf&quot;&gt;next?&lt;/span&gt;
  &lt;span class=&quot;o&quot;&gt;!&lt;/span&gt;&lt;span class=&quot;vi&quot;&gt;@source&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;next&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;blank?&lt;/span&gt;
&lt;span class=&quot;k&quot;&gt;end&lt;/span&gt;

&lt;span class=&quot;k&quot;&gt;def&lt;/span&gt; &lt;span class=&quot;nf&quot;&gt;previous?&lt;/span&gt;
  &lt;span class=&quot;o&quot;&gt;!&lt;/span&gt;&lt;span class=&quot;vi&quot;&gt;@source&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;previous&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;blank?&lt;/span&gt;
&lt;span class=&quot;k&quot;&gt;end&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;


&lt;p&gt;Then to use it, go to your liquid template and add the following somewhere important:&lt;/p&gt;

&lt;div class=&quot;highlight&quot;&gt;&lt;pre&gt;&lt;code class=&quot;ruby&quot;&gt;&lt;span class=&quot;c1&quot;&gt;#previous link&lt;/span&gt;

  &lt;span class=&quot;o&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;a&lt;/span&gt; &lt;span class=&quot;n&quot;&gt;href&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;=&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;&amp;quot;/&amp;quot;&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;home&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span class=&quot;sr&quot;&gt;/a&amp;gt;&lt;/span&gt;


&lt;span class=&quot;sr&quot;&gt;#next link&lt;/span&gt;

&lt;span class=&quot;sr&quot;&gt;  &amp;lt;a href=&amp;quot;/&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;&amp;quot;&amp;gt;home&amp;lt;/a&amp;gt;&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;


&lt;p&gt;If you want the links to have different text, say next/previous, you need to change the previous like so&lt;/p&gt;

&lt;div class=&quot;highlight&quot;&gt;&lt;pre&gt;&lt;code class=&quot;ruby&quot;&gt;&lt;span class=&quot;c1&quot;&gt;#previous link&lt;/span&gt;

  &lt;span class=&quot;o&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;a&lt;/span&gt; &lt;span class=&quot;n&quot;&gt;href&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;=&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;&amp;quot;/&amp;quot;&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span class=&quot;n&quot;&gt;home&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span class=&quot;sr&quot;&gt;/a&amp;gt;&lt;/span&gt;


&lt;span class=&quot;sr&quot;&gt;#next link&lt;/span&gt;

&lt;span class=&quot;sr&quot;&gt;  &amp;lt;a href=&amp;quot;/&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;&amp;quot;&amp;gt;home&amp;lt;/a&amp;gt;&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;


&lt;p&gt;It would appear that the prev/next_article filters check to see if one exists, but I prefer to link back to home for usability purposes, and this lets me do that.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>embed mobileme in a design</title>
		<link href="http://tesoriere.com/2009/04/11/mobileme-for-a-picture-gallery/"/>
		<updated>2009-04-11T00:00:00-04:00</updated>
		<id>http://cartera.me/2009/04/11/mobileme-for-a-picture-gallery</id>
		<content type="html">&lt;p&gt;&lt;img src=&quot;http://tesoriere.com/assets/2009/4/12/mobileme.png&quot; style=&quot;height:80px;width:auto;float:right;margin-left:10px&quot; /&gt; On the right there's a new link for 'pictures', I'm embedding a mobileme gallery within the frame of the extremely wide tesoriere.com layout. It's not thaaaat terrible, but honestly, don't most people use facebook now?&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;

&lt;p&gt;The relevant code is simple, and can be found through iWeb, but to save you the trouble:&lt;/p&gt;

&lt;p&gt;&lt;code class=&quot;html&quot;&gt;&lt;/p&gt;

&lt;iframe src=&quot;http://gallery.me.com/&lt;username&gt;&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot;&gt;
&lt;/iframe&gt;


&lt;p&gt;&lt;/code&gt;&lt;/p&gt;

&lt;p&gt;You have to give it a big enough frame [w:855px,h:630px], or allow it to scroll.&lt;/p&gt;

&lt;p&gt;PS. It's also hosted on MobileMe with a CNAME pointing to web.me.com from me.tesoriere.com.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>up next</title>
		<link href="http://tesoriere.com/2009/03/07/up-next/"/>
		<updated>2009-03-07T00:00:00-05:00</updated>
		<id>http://cartera.me/2009/03/07/up-next</id>
		<content type="html">&lt;p&gt;&lt;a href=&quot;http://www.tesoriere.com/assets/2008/6/8/sandalhut.png&quot; rel=&quot;lightbox&quot;&gt;&lt;img src=&quot;http://www.tesoriere.com/assets/2008/6/8/sandalhut.png&quot; style=&quot;height:auto;width:400px&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;Last year, I completed a simple commerce website where I used my own solution written in rails. It worked, but it was a very simple application, not much flare, not much ajax (which is omg exciting). So for this, it would've wound up being a little too simplistic, and to avoid having to reinvent the square wheel, I tried using substruct. Substruct is great for what it is, but it hasn't been updated in some time now, so I tried redoing it with spree, and that's where I am now. The transition has been pretty smooth since I had finished most of the views already. As far as the functionality, it seems like a winner! Huzzah.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>mephisto - section with multiple pages on homepage (static intro page)</title>
		<link href="http://tesoriere.com/2008/06/21/mephisto-section-with-multiple-pages-on-homepage-static-intro-page/"/>
		<updated>2008-06-21T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/06/21/mephisto-section-with-multiple-pages-on-homepage-static-intro-page</id>
		<content type="html">&lt;p&gt;!http://www.tesoriere.com/assets/2008/6/21/Picture_3.gif(mephisto picture)!&lt;/p&gt;

&lt;p&gt;The way mephisto works, you can't have a static intro page (one article per page, a 'paged' section), and a blog in a subdirectory (ie. /journal). These options are found under the 'sections' tab.&lt;/p&gt;

&lt;p&gt;The reason it breaks is because of the way mephisto uses permanent links. It won't prefix permanent links with the URL associated with their section.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;There are a number of ways to fix this:&lt;/strong&gt;&lt;/p&gt;

&lt;h1&gt;sneaky template manuvering (the solution I took described below)&lt;/h1&gt;

&lt;h1&gt;changing the way permanent links are constructed in the mephisto code-base (seemingly the proper way) and submitting a patch to include it in future revisions&lt;/h1&gt;

&lt;h1&gt;just moving the whole mephisto installation to a subdirectory. This has it's problems because you wouldn't have access to the articles at all to slap on your introduction page. I use them to represent the 'portfolio' on this website.&lt;/h1&gt;

&lt;p&gt;The first method is the quickest; using the templates to achieve this is fairly simple and straightforward. In your 'layout.liquid', which is the default template, you can add the following:&lt;/p&gt;

&lt;pre&gt;
&lt;code class=&quot;ruby&quot;&gt;

Include file ''journal'' contains invalid characters or sequences

&lt;/code&gt;
&lt;/pre&gt;


&lt;p&gt;There also exists a '&lt;em&gt;home.liquid' and '&lt;/em&gt;journal.liquid' template with however you want them to be designed. And that's it!&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>datamapper - many-to-many parent child relationship</title>
		<link href="http://tesoriere.com/2008/06/17/datamapper-many-to-many-parent-child-relationship/"/>
		<updated>2008-06-17T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/06/17/datamapper-many-to-many-parent-child-relationship</id>
		<content type="html">&lt;p&gt;I started playing around with datamapper to see if I could model an many to many parent/child relationship (self-referential habtm?) for an upcoming project. The plan was to use sproutcore for the gui (once I figured it out!), and merb as a webservice that it interacts with.&lt;/p&gt;

&lt;p&gt;&quot;Justin gave me a kickstart&quot;:http://jit.nuance9.com/2008/06/datamapper-parent-child-relationship.html with datamapper, and I eventually came up with:&lt;/p&gt;

&lt;pre&gt;
&lt;code class=&quot;ruby&quot;&gt;
#Person.rb
class Person
  include DataMapper::Resource


  property :id, Integer, :serial =&gt; true

  has n, :relationships
  has n, :parents, :through =&gt; :relationships, :class_name =&gt; 'Person'
  has n, :children, :through =&gt; :relationships, :class_name =&gt; 'Person'


  # parent = Person.create()
  # child = Person.create()
  # relationship = Relationship.new(:parent =&gt; parent)
  # child.relationships &lt;&lt; relationship
  # child.save

end

#Relationship.rb
class Relationship
  include DataMapper::Resource
  
  property :id, Integer, :serial =&gt; true
  belongs_to :person
  belongs_to :parent, :class_name =&gt; 'Person'
  belongs_to :child, :class_name =&gt; 'Person'
end
&lt;/code&gt;
&lt;/pre&gt;


&lt;p&gt;I'll eventually write some spec's for it.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>new design</title>
		<link href="http://tesoriere.com/2008/06/04/new-design/"/>
		<updated>2008-06-04T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/06/04/new-design</id>
		<content type="html">&lt;p&gt;There's a new design up today, and it came out pretty well. I still believe it needs more &lt;a href=&quot;http://mootools.net&quot;&gt;cowbell&lt;/a&gt; for it to truly shine. It runs on &lt;a href=&quot;http://mephistoblog.com&quot;&gt;mephisto&lt;/a&gt; and uses &lt;a href=&quot;http://www.digitalia.be/software/slimbox&quot;&gt;slimbox&lt;/a&gt; for the lightbox popups.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>home</title>
		<link href="http://tesoriere.com/2008/06/04/home/"/>
		<updated>2008-06-04T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/06/04/home</id>
		<content type="html">&lt;pre&gt;&lt;code&gt;            &amp;lt;div id=&quot;intro&quot;&amp;gt;&amp;lt;span class=&quot;r&quot;&amp;gt;SCOTT TESORIERE&amp;lt;/span&amp;gt; constructs custom &amp;lt;span class=&quot;y&quot;&amp;gt;web sites&amp;lt;/span&amp;gt;, web applications, web-services, networks, and is able to &amp;lt;span class=&quot;y&quot;&amp;gt;diagnose and repair&amp;lt;/span&amp;gt; any problems relating to computers and computer security. He is based in &amp;lt;span class=&quot;y&quot;&amp;gt;Jupiter, FL&amp;lt;/span&amp;gt; and is available throughout Florida and available to help you realize your business needs.&amp;lt;/div&amp;gt;
&lt;/code&gt;&lt;/pre&gt;
</content>
	</entry>
	
	<entry>
		<title>dr lorne s. stitsky - revised</title>
		<link href="http://tesoriere.com/2008/05/29/dr-lorne-s-stitsky-revised/"/>
		<updated>2008-05-29T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/05/29/dr-lorne-s-stitsky-revised</id>
		<content type="html">&lt;p&gt;&lt;a href=&quot;http://www.tesoriere.com/assets/2008/5/29/Picture_1.png&quot; rel=&quot;lightbox[portfolio]&quot;&gt;&lt;img src=&quot;http://www.tesoriere.com/assets/2008/5/29/Picture_1.png&quot; style=&quot;width:400px;height:auto&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;I just finished the 2nd version of &lt;a href=&quot;http://drstitsky.com&quot;&gt;Dr. Stitsky's website&lt;/a&gt; to match his current marketing materials.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>gardenhouse</title>
		<link href="http://tesoriere.com/2008/05/28/gardenhouse/"/>
		<updated>2008-05-28T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/05/28/gardenhouse</id>
		<content type="html">&lt;p&gt;&lt;a title=&quot;Gardenhousedecor.net&quot; rel=&quot;lightbox[portfolio]&quot; href=&quot;http://lh4.ggpht.com/scott.tesoriere/SDQN4ihl72I/AAAAAAAAAWE/FhzYEivy5vo/Picture%201.png?imgmax=800&quot;&gt;&lt;img alt=&quot;picture of gardenhousedecor.net&quot; src=&quot;http://lh4.ggpht.com/scott.tesoriere/SDQN4ihl72I/AAAAAAAAAWE/FhzYEivy5vo/s400/Picture%201.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;br /&gt;&lt;br /&gt;


&lt;p&gt;I just finished developing a website for Cheryl Maeder, for her business, &lt;a href=&quot;http://gardenhousedecor.net/&quot;&gt;Gardenhouse&lt;/a&gt;. They designed the majority of it, and I used &lt;a href=&quot;http://textpattern.com/&quot;&gt;textpattern&lt;/a&gt; to control the backend, using &lt;a href=&quot;http://www.digitalia.be/software/slimbox&quot;&gt;Slimbox&lt;/a&gt; to display pictures, and &lt;a href=&quot;http://www.electricprism.com/aeron/slideshow/&quot;&gt;Slideshow 2.0&lt;/a&gt; for the 'art' page. Everything worked out &lt;a href=&quot;http://gardenhousedecor.net/web14&quot;&gt;pretty well&lt;/a&gt;.&lt;/p&gt;
</content>
	</entry>
	
	<entry>
		<title>dr lorne s. stitsky</title>
		<link href="http://tesoriere.com/2008/05/28/dr-lorne-s-stitsky/"/>
		<updated>2008-05-28T00:00:00-04:00</updated>
		<id>http://cartera.me/2008/05/28/dr-lorne-s-stitsky</id>
		<content type="html">&lt;p&gt;&lt;a title=&quot;drstitsky.com&quot; rel=&quot;lightbox[portfolio]&quot; href=&quot;http://lh4.ggpht.com/scott.tesoriere/SDQbDihl73I/AAAAAAAAAWM/OA1RGfEmKig/Picture%201.png?imgmax=720&quot;&gt;&lt;img style=&quot;cursor:pointer; cursor:hand;&quot; src=&quot;http://bp1.blogger.com/_jMVuxhHFgcI/SDQbDihl73I/AAAAAAAAAWM/s_IoMWewhFc/s400/Picture+1.png&quot; border=&quot;0&quot; alt=&quot;picture of drstitsky.com&quot; id=&quot;BLOGGER_PHOTO_ID_5202813217141026674&quot; /&gt;&lt;/a&gt;&lt;/p&gt;

&lt;br /&gt;&lt;br /&gt;


&lt;p&gt;I recently finished a web site for &lt;a href=&quot;http://drstitsky.com/&quot;&gt;Dr. Lorne L. Stitsky&lt;/a&gt;, for his personal practice. His slogan is, &quot;putting the care back into healthcare... one house call at a time&quot;. It's not just a marketing ploy either, he actually makes housecalls. I designed and developed the site, it uses &lt;a href=&quot;http://mephistoblog.com/&quot;&gt;Mephisto&lt;/a&gt; as a backend and &lt;a href=&quot;http://www.huddletogether.com/projects/lightbox2/&quot;&gt;Lightbox&lt;/a&gt; for the gallery.&lt;/p&gt;

&lt;br /&gt;


&lt;br /&gt;&lt;b&gt;Update&lt;/b&gt;: the site is pending a redesign to match Dr Stitsky's new theme. The website was created before he had a theme set in mind.

</content>
	</entry>
	
</feed>