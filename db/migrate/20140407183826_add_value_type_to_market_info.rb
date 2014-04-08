class AddValueTypeToMarketInfo < ActiveRecord::Migration
  def change
    add_column :market_infos, :value_type, :integer
  end
end
