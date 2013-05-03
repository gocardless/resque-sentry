require 'spec_helper'

describe Resque::Failure::Sentry do
  it "sends errors to Sentry" do
    exception = StandardError.new("Test Error")
    worker = Resque::Worker.new(:test)
    queue = "test"
    payload = {'class' => Object, 'args' => 1}

    event = mock
    Raven.expects(:capture_exception).with(exception)

    backend = Resque::Failure::Sentry.new(exception, worker, queue, payload)
    backend.save
  end
end

