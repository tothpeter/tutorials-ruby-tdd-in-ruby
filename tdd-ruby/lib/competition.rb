class Competition
  attr_accessor :questions

  def initialize questions = []
    @questions = questions
  end

  class Closed < StandardError
  end

  def start
    close
  end
end