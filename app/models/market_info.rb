class MarketInfo < ActiveRecord::Base
  belongs_to :real_estate
  default_scope -> { order('created_at DESC') }
  validates :md_type, :info_date, :event_date, :info_source, :info_status, :info_contact, :real_estate_id, :user_id, :value, :value_type, presence: true
end
