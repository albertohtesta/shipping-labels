class AddStatusToShippings < ActiveRecord::Migration[6.1]
  def change
  	add_column :shippings, :status, :string
  end
end
