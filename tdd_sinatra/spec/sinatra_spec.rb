$:.unshift(File.dirname(__FILE__) + "../../")

require "sinatra"
require "app"
require "rack/test"
require_relative "../../tdd-ruby/spec/spec_helper"

set :environment, :test

describe App do
  include Rack::Test::Methods

  def app
    App
  end

  describe "First test with Sinatra" do
    it "says hello world" do
      get "/"

      last_response.status.should == 200
      last_response.body.should =~ /Hello World/
    end
  end

  describe "Teams" do
    it "allows to create teams" do
      get "/teams/new"
      last_response.body.should =~ /<h1>New team<\/h1>/
    end

    it "has a form" do
      get "/teams/new"
      last_response.body.should =~ /<form.*>.*<\/form>/m
      last_response.body.should =~ /<input.*>/
    end

    it "creates teams" do
      post "/teams", { name: "Random" }
      follow_redirect!

      last_response.body.should =~ /Created team "Random"/
    end
  end

  describe "a competition" do
    context "with not questions" do
      let(:params) { {has_questions: false} }

      it "won't allow teams to enter" do
        post "/teams/1/enter_competition", params
        last_response.status.should == 403 # Forbidden
      end

      # For debugging, showing what is the response
      # it "won't allow teams to enter" do
      #   post "/teams/1/enter_competition", params
      #   last_response.body.should == ''
      # end
    end

    context "with questions" do
      let(:params) { {has_questions: true} }

      it "will allow teams to enter" do
        post "/teams/1/enter_competition", params
        last_response.status.should == 200
      end
    end
  end
end