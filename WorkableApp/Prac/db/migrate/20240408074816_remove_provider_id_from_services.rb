class RemoveProviderIdFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :provider_id, :integer
  end
end
