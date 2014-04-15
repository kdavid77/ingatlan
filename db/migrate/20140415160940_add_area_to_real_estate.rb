class AddAreaToRealEstate < ActiveRecord::Migration
  def change
    add_column :real_estates, :area, :decimal
  end
end
