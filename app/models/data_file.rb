class DataFile < ActiveRecord::Base
  belongs_to :real_estate, dependent: :destroy
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :real_estate_id, presence: true
  validates :user_id, presence: true
  
  def self.save
    flash[:success]="Indul a mandula"
  end
end
