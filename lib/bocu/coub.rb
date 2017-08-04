module Bocu
  class Coub
    include Her::Model
    include CommonScopes

    class << self
      def search(query)
        Search.with_query(query)
      end

      def by_tag(tag_name)
        Bocu::Timelines::Tag.by_tag(tag_name)
      end

      def hot
        Bocu::Timelines::Hot.all
      end

      # definition of coub_of_the_day, newest, random methods
      Bocu::Timelines::Explore::CATEGORIES.each do |category|
        define_method category do
          Timelines::Explore.send(category)
        end
      end
    end
  end
end
