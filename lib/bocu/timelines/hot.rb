module Bocu
  module Timelines
    class Hot
      include Her::Model
      include CommonScopes

      collection_path "#{Bocu::TIMELINE_ENDPOINT}/hot"
      parse_root_in_json :coubs, format: :active_model_serializers
    end
  end
end
