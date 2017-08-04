require 'active_support/concern'

module Bocu
  module CommonScopes
    extend ActiveSupport::Concern

    included do
      scope :order_by, ->(order_by) { where(order_by: order_by) }
      scope :page_of, ->(order_by) { where(page_of: order_by) }
      scope :page, ->(page_number) { where(page: page_number) }
      scope :per_page, ->(per_page_quantity) { where(per_page: per_page_quantity) }
    end
  end
end
