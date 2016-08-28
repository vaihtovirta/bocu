module CoubApi
  module Middleware
    class Parser < Faraday::Response::Middleware
      DATA_KEYS = %i(coubs channels).freeze

      def on_complete(env)
        env[:body] = parse(env[:body])
      end

      private

      def includes_data_keys?(json)
        (json.keys & DATA_KEYS).any?
      end

      def parse(body)
        json = parsed_json(body)
        metadata = json.slice!(*DATA_KEYS) if includes_data_keys?(json)

        { data: json, metadata: metadata || {} }
      end

      def parsed_json(body)
        MultiJson.load(body, symbolize_keys: true)
      end
    end
  end
end
