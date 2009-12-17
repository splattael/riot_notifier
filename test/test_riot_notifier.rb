
require 'helper'
require 'stringio'

class MockNotifier < ::RiotNotifier::None
  def initialize
    super(StringIO.new)
  end

  def notify(color, msg)
    [ color, msg ]
  end

  ::RiotNotifier.order.delete(self)
end

context "RiotNotifier" do
  context "with MockNotifier" do
    setup do
      reporter = MockNotifier.new
      reporter.describe_context(Riot::Context.new("test") {})
      reporter
    end

    asserts("notifies failure in red") { topic.fail("desc", "failed") }.equals([:red, "FAILURE: failed"])
    asserts("notifies error in red") { topic.error("desc", bt!(ArgumentError.new("errored"))) }.equals([:red, "ERROR: errored"])
    asserts("doesn't display results with bad results") do
      topic.report("desc", [:fail, "failure"])
      topic.report("desc", [:error, bt!(ArgumentError.new("error"))])
      topic.results(23.0)
    end.nil

    context "displays results without bad results" do
      asserts("in green") do
        topic.results(0.0).first
      end.equals(:green)
      asserts("correctly") do
        topic.results(0.0).last
      end.matches(/0 passes, 0 failures, 0 errors in 0.000000 seconds/)
    end
  end # with MockNotifier

  context "with RedgreenBinary" do
    setup do
      Class.new(RiotNotifier::RedgreenBinary) do
        def exec(string)
          string
        end
      end.new
    end

    asserts("notify green hello world") { topic.notify(:red, "hello world") }.matches(/red "hello world"/)
    asserts("escape <") { topic.notify(:red, "<Topic>") }.matches(/&lt;Topic>/)
    asserts("quote double quotes") { topic.notify(:red, %{"errored"}) }.matches(/\\"errored\\"/)
  end
end
