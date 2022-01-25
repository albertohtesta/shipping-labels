class AddShipmentIdLabelUrlIdResponseTrackingNumberToShippings < ActiveRecord::Migration[6.1]
  def change
  	add_column :shippings, :shipment_id, :string
  	add_column :shippings, :label_url, :string
  	add_column :shippings, :id_response, :string
  	add_column :shippings, :tracking_number, :string
  end
end
