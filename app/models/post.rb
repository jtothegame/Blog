class Post < ApplicationRecord
  has_many :comments

validates :title, presence: true
validates :body, presence: true
validates :image, presence: true

end
