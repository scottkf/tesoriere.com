--- 
layout: post
title: Integrating and maintaining a calendar of events within the Symphony CMS
tags:
- symphony
- symphony extension
- portfolio
img: symphony-calendar.jpg
---
![Calendar XSLT Utility](http://tesoriere.com/images/assets/2011/symphony-calendar-gist.png "calendar xslt utility")

[Symphony](http://symphony-cms.com) doesn't easily offer a way to integrate a calendar of events into an existing setup, so I've come up with an [XSLT Utility][6] to make it a little easier. 

After having to revisit a calendar of events and kind of [hacking my way through it originally][1], I've come up with another way to incorporate an event calendar more easily into an existing site. A very simple example [is hosted here][2]. The source is [available at github](https://github.com/scottkf/lighthousearts.org). If you have any issues, please discuss them at github or at [the Symphony forums: http://symphony-cms.com/discuss/thread/66262/](http://symphony-cms.com/discuss/thread/66262/).

*Requirements*: 

 1. [Nils' Date and Time Field Extension][3] - Because it uses a nice interface and allows for easier management of events; make sure to take the experimental branch.
 2. [This event I created][4], found on github, placed in your workspace/events folder. 
 3. A section to handle all the events with a single [Date & Time field][5], it must contain at least one *other* field, like name, description, etc. But you can have as many as you like. They will all be displayed, and can be disabled by using CSS display:none; on the `<li>`. For example, if we had a field called description it would be produced as `<li class="description">`, so `.description { display: none; }` would get rid of it.
 4. Attach the event to whatever page you want to display the calendar on. 
 5. Attach a data-source pulling whatever events you wish, you can limit it by date to reduce the amount of entries, but **do not** change the grouping.
 6. Finally, in the page you wish to drop the calendar in, the php xmlns must be added to the `<stylesheet>` tag, and the function to generate the calendar must be used. An example page would look like is below. The second parameter next to the function is the name of the data source. The third is an optional path to link to the event by id so you provide the root path (if none is provided it will just be listed as text). The fourth is an optional class to provide the table with, the default is calendar.


 		<?xml version="1.0" encoding="UTF-8"?>
		<xsl:stylesheet version="1.0"
		        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		        xmlns:php="http://php.net/xsl">

		<xsl:import href="../utilities/master.xsl"/>

		<xsl:template match="/data">

		<h1><xsl:value-of select="$page-title"/></h1>
		<xsl:value-of select="php:function('generate_calendar', 
		  calendar-main-events, concat($root,'/calendar/event'), 
		  'calendar')" disable-output-escaping="yes"/><br />
		</xsl:template>
		</xsl:stylesheet>

*Bugs/features*:

 1. It's not possible to have a date field in the same section you plan to use for the events, it conflicts with a date time field.
 2. If you have two calendars on the same page, when you switch months/years, it will switch them on both calendars.

You can download it at [my Github repo][6].


[1]: http://symphony-cms.com/discuss/thread/32743/
[2]: http://cal.tesoriere.com
[3]: http://symphony-cms.com/discuss/thread/27336/
[4]: https://gist.github.com/902159
[5]: http://symphony-cms.com/discuss/thread/27336/
[6]: https://gist.github.com/902159