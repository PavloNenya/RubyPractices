class CreatePosters < ActiveRecord::Migration[7.1]
  def change
    create_table :posters do |t|
      t.text :description
      t.float :price
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
