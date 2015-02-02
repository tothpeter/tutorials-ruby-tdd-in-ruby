require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/cassettes"
  c.hook_into :webmock
end

# Explicitly enable both syntaxes
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end