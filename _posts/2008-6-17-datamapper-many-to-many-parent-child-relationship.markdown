--- 
layout: post
title: datamapper - many-to-many parent child relationship
tags: 
- datamapper 
- habtm 
- merb
---
I started playing around with datamapper to see if I could model an many to many parent/child relationship (self-referential habtm?) for an upcoming project. The plan was to use sproutcore for the gui (once I figured it out!), and merb as a webservice that it interacts with.  

[Justin gave me a kickstart](http://jit.nuance9.com/2008/06/datamapper-parent-child-relationship.html) with datamapper, and I eventually came up with:


{% highlight ruby %}
#Person.rb
class Person
  include DataMapper::Resource


  property :id, Integer, :serial => true

  has n, :relationships
  has n, :parents, :through => :relationships, :class_name => 'Person'
  has n, :children, :through => :relationships, :class_name => 'Person'


  # parent = Person.create()
  # child = Person.create()
  # relationship = Relationship.new(:parent => parent)
  # child.relationships << relationship
  # child.save

end

#Relationship.rb
class Relationship
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  belongs_to :person
  belongs_to :parent, :class_name => 'Person'
  belongs_to :child, :class_name => 'Person'
end
{% endhighlight %}

I'll eventually write some spec's for it.
