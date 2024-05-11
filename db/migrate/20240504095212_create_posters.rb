class CreatePosters < ActiveRecord::Migration[7.1]
  def change
    create_table :posters do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
