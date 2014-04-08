class AddValueToMarketInfo < ActiveRecord::Migration
  def change
    add_column :market_infos, :value, :integer
  end
end
