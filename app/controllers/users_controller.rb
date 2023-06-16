class UsersController < ApplicationController
     before_action :authorize_request, except: :create
     before_action :find_user, except: %i[create index]
   
     def index 
       @users = User.includes(:phones).all
       render json: @users, status: :ok
     end
   
     def show 
       render json: @user, status: :ok
     end
   
     def create 
      @user = User.new(user_params)
      if @user.save
        id = @user.id
    
        @phones = params[:phones].map do |phone| 
          Phone.create!(number: phone, user_id: id)
        end
    
        Phone.import(@phones) # Use `import` for bulk insertion
        render json: @user, status: :created
      else 
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
   
     def destroy 
       @user.destroy
     end
   
     private 
   
     def find_user
      @user = User.includes(:phones).find_by!(name: params[:name])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
    end
    
   
     def user_params
      params.require(:user).permit(
        :name, :email, :company_name, :address, :detail,
        :password, :password_confirmation,
        phones: []
      )
    end
    
   end
   
