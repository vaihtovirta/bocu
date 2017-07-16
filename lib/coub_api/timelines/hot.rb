module CoubApi
  module Timelines
    class Hot
      include Her::Model
      include CommonScopes

      collection_path "#{CoubApi::TIMELINE_ENDPOINT}/hot"
      parse_root_in_json :coubs, format: :active_model_serializers
    end
  end
end
