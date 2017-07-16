module CoubApi
  module Timelines
    class Tag
      include Her::Model
      include CommonScopes

      collection_path "#{CoubApi::TIMELINE_ENDPOINT}/tag/:tag_name"
      parse_root_in_json :coubs, format: :active_model_serializers

      scope :by_tag, ->(tag_name) { where(tag_name: tag_name) }
    end
  end
end
