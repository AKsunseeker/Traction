class AddYoutubeColumnToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :youtube_url, :string
  end
end
