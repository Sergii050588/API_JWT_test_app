class UserResource < JSONAPI::Resource
  attributes :name, :email, :password
  has_many   :posts, class_name: 'Post'
end
