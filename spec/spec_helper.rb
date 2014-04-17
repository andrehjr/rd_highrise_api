require './lib/rd_highrise_api'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.color_enabled = true
  config.tty = true

  config.formatter = :documentation # :progress, :html, :textmate
end
