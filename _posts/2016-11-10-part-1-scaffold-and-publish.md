---
layout: post
title:  "Part 1 - Scaffold and publish"
categories: walkthough
tags: walkthough jekyll ghpages
date: 2016-11-10 20:11:05 +0100
---



## setup

### go to the base directory of your choice

    cd ~/MyGitHub/


### create a new github repository

    gcli repo create how-to-jekyll \
          --desc "How-to - Static sites with Jekyll and Github Pages" \
          --home="https://rockyroad29.github.io/how-to-jekyll"


### cloning it will set the remote url properly
make sure to use the git: protocol to ease authentication

    git clone git@github.com:RockyRoad29/how-to-jekyll.git
    cd how-to-jekyll


### create an *orphan* gh-pages branch

    git checkout -b gh-pages


## Scaffold

### Create the jekyll skeleton in current directory

    jekyll new --skip-bundle .


### keep track of active ruby version

    echo $RUBY_VERSION > .ruby_version

or

    # echo "rvm use $RUBY_VERSION" > .rvmrc



### patch the gemfile for github-pages

    patch < ~/Devlp/dev-patches/jekyll/github-pages.diff
    bundle update


### save the version

    git add .
    git ci -m "Configured for github-pages"


### Adjust the global settings (title, description, author...)

    $EDITOR _config.yml


### Try it live !

    cat <<EOT > serve.sh
    jekyll serve --watch --drafts --incremental &
    browser-sync start --no-open --no-ui --proxy http://127.0.0.1:4000 --files
    _site/ &
    EOT
    . serve.sh


### open the proxy page, just once

    xdg-open http://localhost:3000


### You need a drafts directory, unpublished

    mkdir _drafts
    echo _drafts >> .gitignore
    git add .


### Is it working ? Then save to version

    git commit -m "Setup site globals and serving site locally"


## publish to github !

    git push origin gh-pages

After a few seconds or minutes, your site is available,
here at <https://rockyroad29.github.io/how-to-jekyll/> .

If there's something wrong in styling, check that
in _config.yml, `baseurl` and `url` are empty (so far).



## Next: [Your own Contents](your-own-contents.html)

Download the script:

  - [steps.sh]({{site.url}}/assets/steps.sh)
