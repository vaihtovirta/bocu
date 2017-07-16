module CoubApi
  class Coub
    include Her::Model
    include CommonScopes

    class << self
      def search(query)
        Search.with_query(query)
      end

      def by_tag(tag_name)
        CoubApi::Timelines::Tag.by_tag(tag_name)
      end

      def hot
        CoubApi::Timelines::Hot.all
      end

      # definition of coub_of_the_day, newest, random methods
      CoubApi::Timelines::Explore::CATEGORIES.each do |category|
        define_method category do
          Timelines::Explore.send(category)
        end
      end
    end
  end
end
