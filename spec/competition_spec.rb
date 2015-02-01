require_relative "spec_helper"
require_relative "../lib/competition.rb"
require_relative "../lib/team.rb"
require_relative "support/matchers/team_support"

describe Competition do
  # Defines variables within the spec scope
  let(:competition) { Competition.new }
  let(:team) { Team.new "Random name" }

  # context is for certain scenarios
  context "having no questions" do
    before { competition.stub(questions: []) }
    # before :each

    it "doesn't accept any teams" do
      competition.should_not allow_teams_to_enter
      #  - or -
      # expect do
      #   team.enter_competition competition
      # end.to raise_error Competition::Closed
    end
  end

  context "having questions" do
    before { competition.stub(:questions => [ "stub" ]) }
    subject { competition }

    it { should allow_teams_to_enter }
  end

  context "when started" do
    it "is closed" do
      competition.should_receive :close
      competition.start
    end
  end
end