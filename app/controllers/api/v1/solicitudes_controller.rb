module Api
  module V1
    class SolicitudesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        #@solicitudes.shippings.new(params[])
      end

      def create
        solicitude = get_data2()
        solicitude.save
        byebug
=begin
        @solicitude = Solicitude.create(fecha: Date.today, tracking_number: '11111')
        @shipping = @solicitude.shippings.new(get_data())
        if @shipping.save
          render json: { message: "Created" }, status: :created
        else
          render json: { errors: @shipping.errors }, status: :unprocessable_entity
        end
=end
      end

      private

      def get_data

          carrier_id = Carrier.find_by(name: params[:carrier]).id
          if !carrier_id
            carrier_id = 1
          end
          name_from = params[:shipment][:address_from][:name]
          street_from = params[:shipment][:address_from][:street1]
          city_from = params[:shipment][:address_from][:city]
          province_from = params[:shipment][:address_from][:province]
          postal_code_from = params[:shipment][:address_from][:postal_code]
          countr_code_from = params[:shipment][:address_from][:country_code]

          name_to = params[:shipment][:address_to][:name]
          street_to = params[:shipment][:address_to][:street1]
          city_to = params[:shipment][:address_to][:city]
          province_to = params[:shipment][:address_to][:province]
          postal_code_to = params[:shipment][:address_to][:postal_code]
          countr_code_to = params[:shipment][:address_to][:country_code]

          dimensions = params[:shipment][:parcels]
          length = dimensions[0][:length]
          width = dimensions[0][:width]
          height = dimensions[0][:height]
          dimensions_unit = dimensions[0][:dimensions_unit]
          weight = dimensions[0][:weight]
          weight_unit = dimensions[0][:weight_unit]
          obj = { carrier_id: carrier_id, name_from: name_from, street_from: street_from, city_from: city_from,
            province_from: province_from, postal_code_from: postal_code_from, 
            countr_code_from: countr_code_from, name_to: name_to, street_to: street_to, city_to: city_to,
            province_to: province_to, postal_code_to: postal_code_to, 
            countr_code_to: countr_code_to, length: length, width: width, height: height, dimensions_unit: dimensions_unit,
            weight: weight, weight_unit: weight_unit }
          return obj
      end

      def get_data2
        soli = Solicitude.new(fecha: Date.today, tracking_number: '11111')

        params[:_json].each_with_index do |r, i|
          carrier_id = Carrier.find_by(name: params[:_json][i][:carrier]).id
          if !carrier_id
            carrier_id = 1
          end
          name_from = params[:_json][i][:shipment][:address_from][:name]
          street_from = params[:_json][i][:shipment][:address_from][:street1]
          city_from = params[:_json][i][:shipment][:address_from][:city]
          province_from = params[:_json][i][:shipment][:address_from][:province]
          postal_code_from = params[:_json][i][:shipment][:address_from][:postal_code]
          countr_code_from = params[:_json][i][:shipment][:address_from][:country_code]

          name_to = params[:_json][i][:shipment][:address_to][:name]
          street_to = params[:_json][i][:shipment][:address_to][:street1]
          city_to = params[:_json][i][:shipment][:address_to][:city]
          province_to = params[:_json][i][:shipment][:address_to][:province]
          postal_code_to = params[:_json][i][:shipment][:address_to][:postal_code]
          countr_code_to = params[:_json][i][:shipment][:address_to][:country_code]

          dimensions = params[:_json][i][:shipment][:parcels]
          length = dimensions[0][:length]
          width = dimensions[0][:width]
          height = dimensions[0][:height]
          dimensions_unit = dimensions[0][:dimensions_unit]
          weight = dimensions[0][:weight]
          weight_unit = dimensions[0][:weight_unit]
          ship = soli.shippings.new(carrier_id: carrier_id, name_from: name_from, street_from: street_from, city_from: city_from, province_from: province_from, postal_code_from: postal_code_from, countr_code_from: countr_code_from, name_to: name_to, street_to: street_to, city_to: city_to, province_to: province_to, postal_code_to: postal_code_to, countr_code_to: countr_code_to, length: length, width: width, height: height, dimensions_unit: dimensions_unit, weight: weight, weight_unit: weight_unit)
        end

        return soli
      end

    end
  end
end