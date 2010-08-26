--- 
layout: post
title: Automatically generated tags and tag clouds with Jekyll (multiple word tags allowed)
tags: jekyll rakefile
---

Jekyll is a great thing, and supports tags right out of the box, but in order to get urls like in mephisto, /tags/something here, you have to either add an extension ([which do exist, though I haven't tried][1]), or generate them with the Rakefile, or however really, but I chose the Rakefile. Luckily [raimonds simanovskis had already done so][2], but his solution didn't support tags with spaces, which I had used in mephisto, and to not break compatibility when switching, I had to edit the relevant part of his Rakefile to support tags with spaces.

So an [an example post looks like this:](http://github.com/scottkf/tesoriere.com/raw/master/_posts/2009-8-31-cloning-an-iso-to-a-usb-flash-drive-or-anywhere-using-dd-in-snow-leopard-10-6-with-a-progress-meter-of-sorts.markdown)

{%highlight yaml%}
--- 
layout: post
title: Cloning an ISO to a USB flash drive (or anywhere) ...
syntax-highlighting: yes
tags: 
- dd
- snow leopard
---
Oh, and Leopard too...
{%endhighlight%}

The original method ([can be viewed in it's entire, original, unedited form  here](http://github.com/scottkf/tesoriere.com/blob/f9959290aad95de65b7bc7fcf7f308bb1053d352/Rakefile#L99-133)). To allow support for tags with space _(which some people don't like but I do!)_, you have to change it so it looks like: 

{% highlight ruby %}
desc 'Generate tags pages'
task :tags  => :tag_cloud do
  puts "Generating tags..."
  require 'rubygems'
  require 'jekyll'
  include Jekyll::Filters

  options = Jekyll.configuration({})
  site = Jekyll::Site.new(options)
  site.read_posts('')

  # Remove tags directory before regenerating
  FileUtils.rm_rf("tags")

  # have to parse the liquid template here and not in jekyll because of spaces in tags
  post_template = IO.read("_includes/post.html")

  site.tags.sort.each do |tag, posts|
    html = <<-HTML
---
layout: default
title: "tagged: #{tag}"
syntax-highlighting: yes
---
  <h1 class="title">#{tag}</h1>
HTML

  posts.sort! { |a,b| b.date <=> a.date }.each do |p|
    html << Liquid::Template.parse(post_template).render("post" => p.to_liquid, "content" => p.transform().to_s)
  end

    FileUtils.mkdir_p("tags/#{tag}")
    File.open("tags/#{tag}/index.html", 'w+') do |file|
      file.puts html
    end
  end
  puts 'Done.'
end	
{% endhighlight %}

### [View my entire Rakefile @github](http://github.com/scottkf/tesoriere.com/blob/master/Rakefile#L100-137). ###

  [1]: http://github.com/rfelix/my_jekyll_extensions
  [2]: http://blog.rayapps.com/2010/08/09/moving-blog-from-wordpress-com-to-jekyll/