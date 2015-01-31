require_relative "spec_helper"
require_relative "../lib/add"


# Describe a class or a method or anything
describe "add function" do
  # Expectation
  it "adds two numbers" do
    add(1,5).should == 6
    # New sytnax
    # expect(add(1,5)).to eq(6)
  end
end