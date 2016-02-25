require 'coub_api/version'
require 'coub_api/configuration'
require 'coub_api/concerns/common_scopes'

module CoubApi
  extend CoubApi::Configuration

  setup!
end
