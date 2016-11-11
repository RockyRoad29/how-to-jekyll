---
layout: post
title: Jekyll Live Preview
category: jekyll
tags: jekyll,framework
date: 2016-11-10 13:55:05 +0100
---

### Jekyll Live preview
```sh
jekyll serve --watch --drafts &
browser-sync start  --noopen --proxy http://127.0.0.1:4000 --files _site/ &
```
Then browse to http://localhost:3000/mypages/

Note there is a gem for that,
[browser-sync-rails](https://github.com/brunoskonrad/browser-sync-rails) ,
but it doesn't save you much: you still need to install nodejs and browsersync.
It would add a dependency for very little benefit.
