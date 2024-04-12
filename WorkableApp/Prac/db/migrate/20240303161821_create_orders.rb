class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :account, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
