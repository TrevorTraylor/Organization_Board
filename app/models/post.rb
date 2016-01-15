class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :title, presence: true, length: {in: 5..30}
  validates :content, presence: true, length: {in: 10..160}

end
