require 'bocu/json_parser'

module Bocu
  module Middleware
    class Parser < Faraday::Response::Middleware
      def on_complete(env)
        env[:body] = Bocu::JsonParser.new(env[:body]).call
      end
    end
  end
end
