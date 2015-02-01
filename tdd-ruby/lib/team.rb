class Team
  attr_accessor :name, :players

  def initialize name, players = []
    raise Expectation unless players.is_a? Array

    @name = name

    raise Expectation if @name && has_bad_name?

    @players = players
  end

  def has_bad_name?
    list_of_words = %w{ crappy bad lousy }
    list_of_words - @name.downcase.split(" ") != list_of_words
  end

  def favored?
    @players.include? "George Clooney"
  end

  def enter_competition competition
    raise Competition::Closed if competition.questions.empty?
  end
end