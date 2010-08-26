--- 
layout: post
title: Dealing with database concurrency (locking) in the Symphony CMS
tags:
- symphony extension
- symphony
- concurrency
---
![picture of it](http://tesoriere.com/assets/2009/6/14/Picture_1.png)

Symphony doesn't natively supported [pessimistic database locking](http://www.google.com/search?q=pessimistic+database+locking), so I created an extension in symphony to handle it, both in the backend and the frontend. It's somewhat complicated to implement, but so far it works pretty great. I created it because one of the next big projects I'm working on will be used by many people at once, and I was considering using symphony to create it, as opposed to Rails.

You can get it [here][1].

Report any issues at [GitHub][2].

  [1]: https://github.com/scottkf/pessimistic-db-locking/tree
  [2]: https://github.com/scottkf/pessimistic-db-locking/issues
