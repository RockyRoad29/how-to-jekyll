---
layout: post
title: Part 2 - Your own contents
category: walkthough
tags: jekyll walkthough
date: 2016-11-10 20:00:28 +0100
---

## Move initial contents

The original *About* page contains useful links, keep it for reference,
but as a simple post.

First move the file and tell git about it.

    git mv  about.md  _posts/`date +%Y-%m-%d`-about-jekyll.md
    git ci -m "moved original 'about.md' to a simple post'

Then correct the *front matter*

    sed -i -e '/layout:/ s/page/post/' \
           -e '/permalink:/ d' \
           -e '/title:/ s/$/ Jekyll/' \
           _posts/`date +%Y-%m-%d`-about-jekyll.md

    git ci -m "Corrected front matter"

## Easier post creation

Now this voodoo with backticks and sed works, but it's neither
safe or comfortable, neither neat to document.

There must be a simpler way:
[jekyll-compose](https://github.com/jekyll/jekyll-compose) .

Make sure to install it as a jekyll-plugin, and run bundle.

Note that since we moved the `about.md` file, the link has disappeared
from the pages header. We'd need to create a proper one.

```
$ jekyll help page
jekyll page -- Creates a new page with the given NAME

Usage:

  jekyll page NAME

Options:
-x EXTENSION, --extension EXTENSION  Specify the file extension
 -l LAYOUT, --layout LAYOUT  Specify the page layout
        -f, --force        Overwrite a page if it already exists
            --config CONFIG_FILE[,CONFIG_FILE2,...]  Custom configuration file
        -s, --source SOURCE  Custom source directory
        -s, --source [DIR]  Source directory (defaults to ./)
        -d, --destination [DIR]  Destination directory (defaults to ./_site)
            --safe         Safe mode (defaults to false)
        -p, --plugins PLUGINS_DIR1[,PLUGINS_DIR2[,...]]  Plugins directory (defaults to ./_plugins)
            --layouts DIR  Layouts directory (defaults to ./_layouts)
            --profile      Generate a Liquid rendering profile
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs
```


Ok, the simple version should do:

    jekyll page About

and bam! our link is back in the header !
Let's view it and add some content:

    $EDITOR about.md

Good. Let's commit that.

    git ci -am "Creating new pages or posts with jekyll-compose"

## README
While we're at it, a README file couldn't harm:

    $EDITOR README.md
    git add README.md
    git ci -m "Created README file"
