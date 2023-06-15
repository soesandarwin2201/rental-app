class HousesController < ApplicationController
     def index
       house_list = House.includes(:images, :addresses, :attributions)
       render json: {
         data: {
           houses: house_list.as_json(include: :images)
         }
       }, status: :ok
     end
   
     def show
       house = House.find_by(id: params[:id])
   
       if house
         render json: {
           data: {
             house: house.as_json(include: [:images, :addresses, :attributions])
           }
         }, status: :ok
       else
         render json: {
           data: {
             errors: "Couldn't find a house with id: #{params[:id]}"
           }
         }, status: :bad_request
       end
     end

     def create 
      house = House.new(house_params)

      if house.save 
        id = house.id
       
      @images = params[:images].map do |image| 
        { link: image, house_id: id}
      end

      Image.insert_all(@images)
      render json: {
        stauts: "House created successfully with id: #{id}",
        data: {
          house_id: id
        }
      },status: :201
      else 
        render json: {
          stauts: 'You get error while creating house',
          data: {
            errors: house.errors
          }
        },status: :bad_request
     end
    end
   end
   
