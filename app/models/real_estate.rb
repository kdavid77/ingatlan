class RealEstate < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }  
  has_many :detail, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :data_file, dependent: :destroy
  has_many :img_file, dependent: :destroy
  has_many :market_info, dependent: :destroy
end
