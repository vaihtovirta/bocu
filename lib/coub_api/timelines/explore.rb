module CoubApi
  module Timelines
    class Explore
      include CommonScopes, Her::Model

      CATEGORIES = %i(random newest coub_of_the_day).freeze

      collection_path "#{CoubApi::Configuration::TIMELINE_ENDPOINT}/explore/:category_id"
      parse_root_in_json :coubs, format: :active_model_serializers

      CATEGORIES.each do |category|
        scope category, -> { where(category_id: category) }
      end
    end
  end
end
