class AddCountyToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_addresses, :county_id, :integer
  end
end
