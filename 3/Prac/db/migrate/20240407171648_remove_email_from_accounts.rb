class RemoveEmailFromAccounts < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :email, :string
  end
end
