class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.date :date
      t.references :account, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
