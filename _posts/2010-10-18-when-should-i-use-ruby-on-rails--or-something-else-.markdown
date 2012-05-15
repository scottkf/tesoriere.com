--- 
layout: post
title: When should I use Ruby on Rails, or something else? (Comparing Symphony and Rails)
tags:
- rails
- symphony
- development
---

When beginning a new project, the first thing I come across is what software/language/methodology do I use to complete the project? The answer is quite simple, _it depends_. 

## Oh, you clever chap, what a cheeky answer

The truth of that matter is, it does depend solely on your application requirements and your knowledge of what's available. Nearly 90% of the time in my situation, it either comes down to either of two things: 

* [Ruby on Rails](http://rubyonrails.org) or
* [Symphony CMS][1]

The other 10% of the time I use my own solution, as in [SAMOS](http://samos.coaps.fsu.edu), but that's for another day.

Both Rails and Symphony subscribe to a [Model-View-Controller (MVC)](http://en.wikipedia.org/wiki/Model%E2%80%93View%E2%80%93Controller) architectural software design methodology. Rails treats the methodology quite literally, while Symphony does so a little more loosely. The nomenclature in each are as follows:

<table>
	<tr><td></td><th><strong>Rails</strong></th><th><strong>Symphony</strong></th></tr>
	<tr><td><em>Model</em></td><td>Model</td><td>Section</td></tr>
	<tr><td><em>View</em></td><td>View</td><td>Pages</td></tr>
	<tr><td><em>Controller</em></td><td>Controller</td><td>Data-Sources/Pages/Components</td></tr>
</table>

I won't really describe rails much, because there's plenty of information about it. A great place to start is here: <http://edgeguides.rubyonrails.org/getting_started.html>.

## Then I'll go somewhere else!

_However_, [Symphony][1] could use some explanation. Symphony's models are called sections (which contain many fields, just like fields in a database), and they are just like rails models. It's views are controlled by pages, and it's controllers are controlled (hah!) by data-sources, pages, and components. While that may be a little confusing, it works quite wonderfully. 

**Pages** control what gets output as HTML, but you can also include logic in them, just like Rails does with ERB/HAML. However, a best practice is to stub out a lot of the logic into components (templates) to make it more DRY.

**Data-sources** are the link between the pages/components and the sections/fields. In rails, this would be the ActiveRecord interface. They grab data in a certain way based on lots of different things in lots of different ways.<small> I couldn't be more vague, I know.</small>

**Components** are similar to helpers/partials in rails, where you can lump similar things together so you can reuse them.

## Go on then, answer the original question

How I decide which to use basically involves me looking at this table and deciding how I feel like torturing myself for that certain project. Most of the time the biggest issues are whether or not it contains a lot of logic that needs to be tested, and which template language I want to use.

<table>
	<tr><td></td><th><strong>Rails</strong></th><th><strong>Symphony</strong></th></tr>
	<tr><td><em>Testable?</em></td><td>Yes, I use BDD</td><td>Not so much</td></tr>
	<tr><td><em>Template Language</em></td><td>ERB/HAML</td><td>XSLT (this is quite amazing)</td></tr>
	<tr><td><em>GUI</em></td><td>Nope</td><td>Yes, <a href="http://symphony-cms.com/workspace/assets/images/backend/section-table-1259390359.png">you can see an example here</a></td></tr>
	<tr><td><em>Output</em></td><td>HTML/XML/JSON/etc</td><td>HTML (as xml), JSON</td></tr>
	<tr><td><em>Database</em></td><td>Everything you can throw at it</td><td>MySQL</td></tr>'
	<tr><Td><em>Hosted at Godaddy?</em></td><td>FML</td><td>DIAF</td></tr>
</table>

There are a couple other things to compare, but these are often the most important.

## Great! Losing patience, how do you decide?

If it's more of a web application and not as much as website, I often use rails, because they usually involve logic that should be **tested**.

The **template language** shouldn't be, but is a huge issue to a shallow individual such as myself. You can do exactly the same stuff in both ERB/HAML and XSLT. They both have their advantages and disadvantages. ERB/HAML's main pro going for is that it's easy to use and quite succinct. XSLT's plus is that it's XSLT and lets you traverse data (XML) in such an amazing way, but it comes at price, it's quite verbose and ancient (it's from 1999). For me? _It depends_, again, and how bored I am with one over the other.

Whether or not I need Symphony's **GUI** is also another important issue. If I don't feel like building an interface and using the default Symphony UI for tech-savvy clients I will often choose this (though you can also make your own interface as well).

Once again, if it's more of web app, I'll often use rails because I might need an API (where I might need to **output** XML/JSON) right away, or at some point in the future. In Symphony, you can output XML right out of the box, and can [create a REST API](http://symphony-cms.com/discuss/thread/32047/), but the CUD part of CRUD is a little harder to manage in symphony this way.

The **database** usually isn't as huge issue, and mainly depends on where the app/site is being hosted. Symphony currently only supports MySQL, but nearly every host supports MySQL, so whatever!

And there you have it, it simply _depends_, on... lots of stuff. &lt;/shill>



  [1]: http://symphony-cms.com