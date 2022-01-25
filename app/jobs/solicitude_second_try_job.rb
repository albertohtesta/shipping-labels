class SolicitudeSecondTryJob < ApplicationJob
  queue_as :default
  include Interfaceable

  def perform(shipping)
    object_for_carrier = format_object_for_carrier(shipping)
  	endpoint = shipping.carrier.endpoint
    token = shipping.carrier.token
    @response = Carrierservice::SendSolicitude.send(object_for_carrier, endpoint, token)
    check_response_and_save_shippings_status(@response, shipping)
  end

end
