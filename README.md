# resque-sentry

A Resque failure backend that sends errors to [Sentry](https://getsentry.com).

### Installation

```console
$ gem install resque-sentry
```

### Usage

Add the following to an initializer:

```ruby
require 'resque-sentry'

Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Sentry]
Resque::Failure.backend = Resque::Failure::Multiple
```

