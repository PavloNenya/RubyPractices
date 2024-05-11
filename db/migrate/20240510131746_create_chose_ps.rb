class CreateChosePs < ActiveRecord::Migration[7.1]
  def change
    create_table :chose_ps do |t|
      t.references :service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :choice

      t.timestamps
    end
  end
end
