travis-restarts
============

Heroku app to restart rOpenSci Travis-CI builds

Uses

* Heroku
* You should have the heroku cli tool installed
* [Travis-CI Ruby gem](https://github.com/travis-ci/travis.rb)
* Adapted form [philou/daily-travis](https://github.com/philou/daily-travis)

Note: After a few days the Heroku scheduler didn't work. I reset the scheduler from once per day to once per 10 minutes - it started working - then switched back to once per day. Now it seems to work again. Heroku states that the service is 100% reliable - indeed. Explored `clockwork` gem a bit, but didn't fully figure it out yet for a rack app (most egs are for Rails apps).

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
