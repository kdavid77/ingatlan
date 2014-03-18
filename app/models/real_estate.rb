class RealEstate < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }  
  has_many :detail, dependent: :destroy
end
