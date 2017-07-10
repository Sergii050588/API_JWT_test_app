class User < ApplicationRecord
  include PgSearch
  has_many :posts, class_name: 'Post'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :by_post_count, -> { where("User.posts.count >=", 1) }


  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end

  pg_search_scope :search, against: [:name, :email]

  def self.text_search(query)
    return all if query.blank?
    search(query)
  end
end
