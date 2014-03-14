class CreateRealEstates < ActiveRecord::Migration
  def change
    create_table :real_estates do |t|
      t.string :rs_type
      t.string :locality
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
