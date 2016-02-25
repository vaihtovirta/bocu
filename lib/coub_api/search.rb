module CoubApi
  class Search
    include CommonScopes, Her::Model

    collection_path CoubApi::Configuration::SEARCH_ENDPOINT
    parse_root_in_json :coubs, format: :active_model_serializers

    scope :with_query, ->(query) { where(q: query) }
  end
end
