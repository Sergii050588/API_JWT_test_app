class Post < ApplicationRecord
include PgSearch
has_one :user, class_name: 'User'

pg_search_scope :search, against: [:name, :body, :created_at]

scope :by_created_at, -> (from, to) { where("created_at >= ? AND created_at <= ?", from, to) }


  def self.text_search(query)
    return all if query.blank?
    search(query)
  end
end