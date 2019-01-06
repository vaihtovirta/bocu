require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'bocu'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'minitest-vcr'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

MinitestVcr::Spec.configure!
