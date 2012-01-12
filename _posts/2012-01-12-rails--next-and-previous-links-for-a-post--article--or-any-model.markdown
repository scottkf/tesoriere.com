--- 
title: "Rails &#8212; A faster way for next and previous links on a post, article, or any model"
layout: post
tags:
- rails
---


This is a simple, but common question I come across when dealing with people learning rails, as they inevitably do a bloggish type app first.

### I assume you have a model like the one below

{% highlight ruby %}
class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
{%endhighlight%}

### Adding the next/prev links

Personally, I prefer to add instance methods as well as a scope or a class method. Check it out below:

{%highlight ruby%}
class Article < ActiveRecord::Base
	scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
	scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

	def next
	  Article.next(self.id).first
	end

	def previous
	  Article.previous(self.id).first
	end

	#### used below to benchmark
	# scope :next_by_date, lambda {|created_at| where("created_at > ?",created_at).order("created_at ASC") } # this is the default ordering for AR
	# scope :previous_by_date, lambda {|created_at| where("created_at < ?",created_at).order("created_at DESC") }

	# def next_by_date
	#  Article.next_by_date(self.created_at).first
	# end

	# def previous_by_date
	#  Article.previous_by_date(self.created_at).first
	# end

end
{%endhighlight%}

### How it works

If you're confused, don't be! Let's assume we have an array of article ids: `[1,2,4,6]`. If we're looking for the next article for **2**, it would obviously be **4**. Programmatically, you can't just say `Article.find(id+1)`, because it won't exist in some situations where articles are deleted. 

We have to find the next id above **2**, hence `where("id > ?", id)`. However, if you order the ids *descending* you'll get **6**, because **6** is the highest in the list while still being larger than **2**. Knowing that, we then sort the list *ascending*, because **4** will be first on the list when ordering *ascending*.

This, of course, assumes you're using the instance methods as I did, if you used `.last` instead, the ordering for each would be reversed.


### It's slightly faster than sorting by a date, or any other field not indexed

Since you're sorting by the primary key, it should be much faster than sorting by any other field, as the primary key is usually indexed in most databases. Plus, it's computationally easier to sort an integer, however slightly.

For example:

{%highlight ruby%}
sql = "INSERT INTO articles (title, body, user_id, created_at) VALUES "
array = []
n = 100000
n.times do |i| 
  array << "('#{i}','#{i}', 1, '#{eval("#{i}.days.ago")}')"
end
sql += array.join(",")
ActiveRecord::Base.connection.execute(sql)
Benchmark.bm do |x|
  x.report { Article.first.next_by_date }
  x.report("by date: ") { Article.first.next_by_date }
  x.report { Article.first.next }
  x.report("by id: ") { Article.first.next }
end
{%endhighlight%}

I ran each twice just incase some caching occurred, and the results were:

{%highlight bash%}
      user     system      total        real
by date:   0.000000   0.000000   0.000000 (  0.017141)
by id:     0.000000   0.000000   0.000000 (  0.000682)
{%endhighlight%}

Changing the repetition will demonstrate a linear pattern, say O(n), for finding the next by, whereas by date will demonstrate a more exponential pattern, perhaps nearing O(n^2).

