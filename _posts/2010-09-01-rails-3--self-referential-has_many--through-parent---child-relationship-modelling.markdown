--- 
layout: post
title: Rails 3.x &#8212; Self-referential has_many :through Parent&lt;->Child relationship modelling
tags:
- rails
- self join
- has_many through
- habtm
---

## Seriously? ##

Srsly, that's more of an SEO title than anything, because damnit, I know how the hell it works at an SQL level and it was frustrating to get working in Rails because of syntax, namely `:class_name => :object`, when it should be `:class_name => "object"`. I hope someone finds this useful, because when it comes to rails 3 there's not too much stuff that's recent.

## Get to the point, show me the goods ##

{% highlight bash %}

rails new confusingTitleProject
cd confusingTitleProject
rails g model Person name:string
rails g model ParentRelationship parent_id:integer child_id:integer

{%endhighlight%}

{% highlight ruby %}

#App/Models/ParentRelationship.rb
class ParentRelationship < ActiveRecord::Base
  belongs_to :parent, :class_name => "Person"
  belongs_to :child, :class_name => "Person"
end

#App/Models/Person.rb
class Person < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name

  has_many     :parent_child_relationships,
               :class_name            => "PersonRelationship",
               :foreign_key           => :child_id,
               :dependent             => :destroy
  has_many     :parents,
               :through               => :parent_child_relationships,
               :source                => :parent

  has_many     :child_parent_relationships,
               :class_name            => "PersonRelationship",
               :foreign_key           => :parent_id,
               :dependent             => :destroy
  has_many     :children,
               :through               => :child_parent_relationships,
               :source                => :child
end


{% endhighlight %}


Then, as an example, you can do the following to add a parent:

{% highlight ruby %}
a = Person.new; b = Person.new
b.parents = [a]
{%endhighlight%}