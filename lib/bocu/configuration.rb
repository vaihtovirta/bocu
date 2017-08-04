require 'her'
require 'bocu/middleware/parser'
require 'bocu/concerns/common_scopes'

module Bocu
  module Configuration
    DEFAULT_ENDPOINT = 'http://coub.com/api/v2'.freeze

    class << self
      def extended(_mod)
        configure
      end

      def configure
        setup_her
        require_models
      end

      private

      def require_models
        require 'bocu/timelines/explore'
        require 'bocu/timelines/hot'
        require 'bocu/timelines/tag'
        require 'bocu/coub'
        require 'bocu/search'
      end

      def setup_her
        Her::API.setup url: DEFAULT_ENDPOINT do |connection|
          connection.use Faraday::Request::UrlEncoded
          connection.use Bocu::Middleware::Parser
          connection.use Faraday::Adapter::NetHttp
          connection.use Faraday::Response::Logger
        end
      end
    end
  end
end
