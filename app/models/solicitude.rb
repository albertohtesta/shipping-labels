class Solicitude < ApplicationRecord
	has_many :shippings

	after_save_commit do
		self.shippings.each do |shipping|
	  		SolicitudeJob.perform_now(shipping)
	  	end
	end

end
