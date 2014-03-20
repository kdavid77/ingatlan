class CreateImgFiles < ActiveRecord::Migration
  def change
    create_table :img_files do |t|
      t.string :file_name
      t.string :file_comment
      t.string :real_estate_id
      t.string :user_id

      t.timestamps
    end
  end
end
