class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :surname
      t.string :fatherly
      t.date :date_of_birth
      t.string :telephone

      t.timestamps
    end
  end
end
