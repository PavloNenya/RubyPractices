# db/migrate/xxxxxx_create_business_models.rb

class CreateBusinessModels < ActiveRecord::Migration[6.0]
  def change
    create_table :business_models do |t|
      t.string :name
      t.integer :index

      t.timestamps
    end
  end
end
