class HousesController < ApplicationController
     def index 
          @all_house = House.all
          @house_list = @all_house.where(user_id)
          
     end
end
