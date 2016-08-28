require 'her'
require 'coub_api/middleware/parser'
require 'coub_api/concerns/common_scopes'

module CoubApi
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
        require 'coub_api/timelines/explore'
        require 'coub_api/timelines/hot'
        require 'coub_api/timelines/tag'
        require 'coub_api/coub'
        require 'coub_api/search'
      end

      def setup_her
        Her::API.setup url: DEFAULT_ENDPOINT do |connection|
          connection.use Faraday::Request::UrlEncoded
          connection.use CoubApi::Middleware::Parser
          connection.use Faraday::Adapter::NetHttp
          connection.use Faraday::Response::Logger
        end
      end
    end
  end
end
