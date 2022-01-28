class Solicitude < ApplicationRecord
	has_many :shippings
	has_many_attached :label_pdfs

	before_create do
		self.status = 'processing'
	end

	after_create_commit do
		self.shippings.each do |shipping|
	  		SolicitudeJob.perform_now(shipping)
	  	end
	end

end
