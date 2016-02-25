# Shoulda matcher to test if class responds to a symbol.
class RespondToMatcher
  def initialize(symbol_name)
    @expected_symbol_name = symbol_name
  end

  def matches?(subject)
    subject.respond_to?(@expected_symbol_name)
  end

  def failure_message
    "Expected to respond to '#{@expected_symbol_name}' but did not"
  end

  def negative_failure_message
    "Expected to not respond to '#{@expected_symbol_name}' but did"
  end

  def description
    "should respond to '#{@expected_symbol_name}'"
  end
end

def respond_to(symbol_name)
  RespondToMatcher.new(symbol_name)
end
