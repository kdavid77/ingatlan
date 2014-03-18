class Comment < ActiveRecord::Base
  belongs_to :real_estate, dependent: :destroy
  belongs_to :user
  default_scope -> { order 'created_at DESC' }
  validates :real_estate_id, presence: true
  validates :user_id, presence: true
end
