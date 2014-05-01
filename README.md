travis-restarts
============

Heroku app to restart rOpenSci Travis-CI builds

Uses

* Heroku
* [Travis-CI Ruby gem](https://github.com/travis-ci/travis.rb)
* Adapted form [philou/daily-travis](https://github.com/philou/daily-travis)

Usage
=====

* Clone this repo locally

```shell
git clone git@github.com:ropensci/travis-restarts.git
```

* If you don't have it yet, install the [heroku toolbelt](https://devcenter.heroku.com/articles/quickstart)

* Create an heroku app to deploy to

```shell
heroku apps:create <app-name>
```

* Deploy to heroku

```shell
git push heroku master
```

* Generate a travis token

```shell
bundle install
bundle exec travis login
bundle exec travis token
```

* Add the parameters to your heroku app

```shell
heroku config:add TRAVIS_REPO_=<github-user>/<github-repo>
heroku config:add TRAVIS_TOKEN=`bundle exec travis token`
```

_Note that those aren't quotes around `bundle exec travis token`, but backticks_

* Test that the latest build is restarted by manually running

```shell
heroku run rake build
```

* Add the scheduler to your heroku app

```shell
heroku addons:add scheduler:standard
heroku addons:open scheduler
```

* Add the task ```rake build``` to your heroku scheduler
