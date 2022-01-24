module Carrierservice

  class SendSolicitude

   def self.send(data)
 	datos = data
	begin
		response = RestClient.post carrier.endpoint, datos, 
		{ content_type: :json, accept: :json, :Authorization => "Token #{carrier.token}" }
	rescue RestClient::ServiceUnavailable
		response = State.new
		response.code = "503"
	rescue RestClient::UnprocessableEntity
		response = State.new
		response.code = "422"
	end
	return response
   end

  end

  class State
	  attr_accessor :code, :body
  end


end
