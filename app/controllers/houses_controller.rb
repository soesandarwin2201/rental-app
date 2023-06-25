class HousesController < ApplicationController
  skip_before_action :authorize_request, only: [:show, :index], raise: false

  def index
    if params[:bl_latitude] && params[:tr_latitude] && params[:bl_longitude] && params[:tr_longitude]
      # Retrieve the latitude and longitude values from the request parameters
      bl_latitude = params[:bl_latitude]
      tr_latitude = params[:tr_latitude]
      bl_longitude = params[:bl_longitude]
      tr_longitude = params[:tr_longitude]

      @all_houses = House.where(latitude: bl_latitude..tr_latitude, longitude: bl_longitude..tr_longitude).with_attached_images
    else
      @all_houses = House.all.with_attached_images
    end

    if params[:filter] == 'true'
      @user_houses = House.where(user_id: current_user).with_attached_images
    else
      @user_houses = nil # or @user_houses = []
    end

    render json: {
      data: {
        houses: @all_houses.as_json(only: [:id, :name, :bathroom, :bedroom, :country, :home_status, :home_type, :longitude, :latitude, :price, :update_date, :desc, :square]),
        userhouses: @user_houses.as_json(only: [:id, :name, :bathroom, :bedroom, :country, :home_status, :home_type, :longitude, :latitude, :price, :update_date, :desc, :square])
      }
    }, status: :ok
  end

        def show
          @house = House.find_by(id: params[:id])
      
          if @house
            render json: {
              data: {
                house: @house.as_json(only: [:id, :name, :bedrooms, :bathrooms, :country, :house_status, :house_type, :latitude, :longitude, :price, :update_date, :detail, :square]),
                images: @house.images.attached? ? @house.images.map { |image| rails_blob_url(image) } : []
              }
            }, status: :ok
          else
            render json: {
              error: "House not found with id: #{params[:id]}"
            }, status: :not_found
          end
        end

        def create
          @house = House.new(house_params.merge(user_id: current_user))
          @house.images.attach(params[:house][:images]) if params[:house][:images].present?

         if @house.save
         render json: { house: @house }, status: :created
         else
         render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
         end
        end

        def destroy
          house = House.find_by(id: params[:id], user_id: current_user)
        
          if house
            house.destroy
            render json: { operation: "House deleted successfully", status: :accepted }
          else
            render json: {
              operation: "Couldn't delete house",
              data: {
                errors: {
                  house: 'Not found'
                }
              }
            }, status: :not_found
          end
        end
        

        private

     def house_params
      params.require(:house).permit(:name, :bathroom, :bedroom, :country, :home_status, :house_type, :longitude, :latitude, :price, :update_date, :desc, :square, :city, :zipcode, :street, :zone)
     end
        
end