class AddUserIdToMarketInfo < ActiveRecord::Migration
  def change
    add_column :market_infos, :user_id, :integer
  end
end
