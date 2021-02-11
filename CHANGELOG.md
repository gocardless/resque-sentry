# CHANGELOG

2.0.1

* Disable background processing of Sentry events, which stops events being sent to Sentry in Resque
  context

2.0.0

* Use `sentry-ruby` (`sentry-raven` is now in maintenance mode)
* Upgrade gemspec to point at new major versions of all dependencies
