class AddPictureToPosters < ActiveRecord::Migration[7.1]
  def change
    add_column :posters, :picture, :string
  end
end
