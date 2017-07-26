# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end

#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end

#   config.shared_context_metadata_behavior = :apply_to_host_groups
# end

$LOAD_PATH.unshift File.expand_path('../../app', __FILE__)

require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require 'app'

module RSpecMixin
  include Rack::Test::Methods
  def app() BrainWritingApp end
end

RSpec.configure { |c| c.include RSpecMixin }
