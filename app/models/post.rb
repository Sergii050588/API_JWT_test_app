class Post < ApplicationRecord
include PgSearch
has_one :user, class_name: 'User'

pg_search_scope :search, against: [:name, :body, :created_at]

scope :created_from, -> (from) do
  where("created_at >= ?", from) if from.present?
end

scope :created_to, -> (to) do
  where("created_at <= ?", to) if to.present?
end

scope :created_order, -> (order) do
  order(created_at: order) if order.present?
end

  def self.text_search(query)
    return all if query.blank?
    search(query)
  end
end
