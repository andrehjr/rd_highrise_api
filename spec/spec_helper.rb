require './lib/rd_highrise_api'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color_enabled = true
  config.tty = true

  config.formatter = :documentation # :progress, :html, :textmate
end
