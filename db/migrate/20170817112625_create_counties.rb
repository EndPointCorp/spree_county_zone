class CreateCounties < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_counties do |t|
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end
end
