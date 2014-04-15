class AddSurfaceToRealEstate < ActiveRecord::Migration
  def change
    add_column :real_estates, :surface, :decimal
  end
end
