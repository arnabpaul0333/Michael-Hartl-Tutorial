class Micropost < ActiveRecord::Base
  belongs_to :user, inverse_of: :microposts

  validates :content, presence: true, length: {maximum:140}
  validates :user_id, presence: true

  default_scope { order('created_at DESC') }
end
