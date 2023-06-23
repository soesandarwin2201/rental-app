class ApplicationController < ActionController::API
     before_action :authorize_request
     attr_reader   :current_user

        def not_found
          render json: { error: 'not_found' }
         end
      
        private 

        def authorize_request
          header = request.headers['Authorization']
          header = header.split(' ').last if header

          if header && header != 'null'
          begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
          rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
          end
        else
          @current_user = nil
        end
        end
end
