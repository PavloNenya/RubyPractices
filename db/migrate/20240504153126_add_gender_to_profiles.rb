class AddGenderToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :gender, :string
  end
end
