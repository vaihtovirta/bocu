module CoubApi
  module Timelines
    class Hot
      include CommonScopes, Her::Model

      collection_path "#{CoubApi::Configuration::TIMELINE_ENDPOINT}/hot"
      parse_root_in_json :coubs, format: :active_model_serializers
    end
  end
end
