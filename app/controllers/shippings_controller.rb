class ShippingsController < ApplicationController

	def index
#		@shippings = Shipping.find_by(solicitude_id: params[:solicitude_id])
		@shippings = Shipping.where(solicitude_id: params[:solicitude_id])
	end
end
