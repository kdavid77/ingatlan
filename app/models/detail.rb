class Detail < ActiveRecord::Base
  belongs_to :real_estate, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :real_estate_id, presence: true
end
