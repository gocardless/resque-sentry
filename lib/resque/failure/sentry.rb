begin
  require 'sentry-ruby'
rescue LoadError
  raise "Can't find 'sentry-ruby' gem. Please add it to your Gemfile or install it."
end
require 'resque'

module Resque
  module Failure
    # Failure backend for Sentry (using the sentry-ruby gem for Sentry).
    # Similar to the Airbrake backend, this sends exceptions raised in Resque
    # jobs to Sentry. To use, add the following to an initializer:
    #
    #   require 'resque/failure/sentry'
    #
    #   Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Sentry]
    #   Resque::Failure.backend = Resque::Failure::Multiple
    #
    class Sentry < Base
      class << self
        attr_reader :logger
      end

      class << self
        attr_writer :logger
      end

      def save
        options = {}
        options[:logger] = self.class.logger if self.class.logger
        options[:extra] = {
          'Object' => payload['class'],
          'Arguments' => payload['args']
        }
        options[:hint] = { background: false }
        ::Sentry.capture_exception(exception, options)
      end

      def self.count(_queue = nil, _class_name = nil)
        # We can't get the total # of errors from Sentry so we fake it by
        # asking Resque how many errors it has seen.
        Stat[:failed]
      end
    end
  end
end
