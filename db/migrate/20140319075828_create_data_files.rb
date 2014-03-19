class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :file_name
      t.string :file_comment
      t.integer :real_estate_id
      t.integer :user_id

      t.timestamps
    end
  end
end
