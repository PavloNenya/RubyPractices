class AddProviderToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :provider, :string
  end
end
