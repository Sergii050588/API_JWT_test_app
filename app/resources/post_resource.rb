class PostResource < JSONAPI::Resource
  attributes :name, :body, :created_at
  has_one    :user, class_name: 'User'
end
