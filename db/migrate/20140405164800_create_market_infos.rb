class CreateMarketInfos < ActiveRecord::Migration
  def change
    create_table :market_infos do |t|
      t.integer :md_type
      t.date :info_date
      t.date :event_date
      t.string :info_source
      t.string :info_status
      t.string :info_contact
      t.integer :real_estate_id
      t.string :comment

      t.timestamps
    end
  end
end
