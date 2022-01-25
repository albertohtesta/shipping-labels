class SolicitudeJob < ApplicationJob
  queue_as :default
  include Interfaceable

  def perform(shipping)
      object_for_carrier = format_object_for_carrier(shipping)
  		endpoint = shipping.carrier.endpoint
      token = shipping.carrier.token
    	@response = Carrierservice::SendSolicitude.send(object_for_carrier, endpoint, token)
      check_response_and_save_shippings_status(@response, shipping)
      if shipping.status != "200"
        SolicitudeSecondTryJob.set(wait_until: 2.minutes.from_now(Time.now)).perform_later(shipping)
      end
	end

end
