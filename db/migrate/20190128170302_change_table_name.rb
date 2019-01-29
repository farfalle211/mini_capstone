class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :image_models, :images
  end
end
