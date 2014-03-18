class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :repar
      t.string :reval
      t.integer :real_estate_id

      t.timestamps
    end
    
    add_index :details, [ :real_estate_id, :created_at ]
  end
end
