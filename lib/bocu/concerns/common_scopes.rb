require 'active_support/concern'

module Bocu
  module CommonScopes
    extend ActiveSupport::Concern

    included do
      scope :order_by, ->(order_by) { where(order_by: order_by) }
      scope :page_of, ->(page_of) { where(page_of: page_of) }
      scope :page, ->(page_number) { where(page: page_number) }
      scope :per_page, ->(per_page_quantity) { where(per_page: per_page_quantity) }
    end
  end
end
