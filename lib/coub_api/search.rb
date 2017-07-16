module CoubApi
  class Search
    include Her::Model
    include CommonScopes

    collection_path CoubApi::SEARCH_ENDPOINT
    parse_root_in_json :coubs, format: :active_model_serializers

    scope :with_query, ->(query) { where(q: query) }
  end
end
