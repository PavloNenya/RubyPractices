class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.references :provider, null: false, foreign_key: true
      t.string :industry

      t.timestamps
    end
  end
end
