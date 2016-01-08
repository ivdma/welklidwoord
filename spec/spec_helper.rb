$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'welklidwoord'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.ignore_hosts 'codeclimate.com'
end

RSpec.configure do |config|
  # Enable filtering of specs
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
