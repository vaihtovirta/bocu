# frozen_string_literal: true
require 'her'
require 'coub_api/middleware/parser'

module CoubApi
  module Configuration
    DEFAULT_ENDPOINT = 'http://coub.com/api/v2'.freeze
    TIMELINE_ENDPOINT = 'timeline'.freeze
    SEARCH_ENDPOINT = 'search'.freeze

    def setup!
      Her::API.setup url: DEFAULT_ENDPOINT do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use CoubApi::Middleware::Parser
        connection.use Faraday::Adapter::NetHttp
        connection.use Faraday::Response::Logger
      end

      require_models
    end

    private

    def require_models
      require 'coub_api/timelines/explore'
      require 'coub_api/timelines/hot'
      require 'coub_api/timelines/tag'
      require 'coub_api/coub'
      require 'coub_api/search'
    end
  end
end
