module Bocu
  class JsonParser
    DATA_KEYS = %i[channels coubs].freeze
    DEFAULT_METADATA = {}.freeze

    def initialize(body)
      @json = MultiJson.load(body, symbolize_keys: true)
    end

    def call
      { data: json, metadata: metadata }
    end

    private

    attr_reader :json

    def metadata
      return DEFAULT_METADATA if no_data_keys?

      json.slice!(*DATA_KEYS)
    end

    def no_data_keys?
      (json.keys & DATA_KEYS).empty?
    end
  end
end
