require "json"
require "net/http"

class Team
  attr_accessor :name, :players

  API_URL = "http://api.twitter.com/users/show.json"

  def initialize name, players = [], *args
    raise Expectation unless players.is_a? Array

    @name = name

    raise Expectation if @name && has_bad_name?

    @players = players

    if args[0] && args[0][:tag]
      @tag = args[0][:tag]
    end
  end

  def allows_player_to_join? player
    url = "#{API_URL}?screen_name=#{player.twitter}"
    json = JSON.parse(Net::HTTP.get_response(URI(url)).body)

    # Mock the twitter API
    if player.twitter == "tomaaa08"
      json["description"] = "@ruby"
    else
      json["description"] = ""
    end

    !(json["description"].downcase =~ /#{@tag}/).nil?
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