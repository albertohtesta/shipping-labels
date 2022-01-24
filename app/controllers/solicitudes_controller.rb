class SolicitudesController < ApplicationController

	def index
		@solicitudes = Solicitude.all
	end

end
