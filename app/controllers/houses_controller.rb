class HousesController < ApplicationController
     def index 
          @all_house = House.all
          
     end
end
