require 'coub_api/configuration'
require 'coub_api/version'

module CoubApi
  SEARCH_ENDPOINT = 'search'.freeze
  TIMELINE_ENDPOINT = 'timeline'.freeze

  extend CoubApi::Configuration
end
