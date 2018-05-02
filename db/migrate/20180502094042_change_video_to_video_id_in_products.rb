class ChangeVideoToVideoIdInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :video, :video_id
  end
end
