module Api
  module V1
    class UsersController < BaseController
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        @users = User.page(params[:page]).per(params[:per_page] || 10)
        render json: @users, 
               each_serializer: Api::V1::UserSerializer,
               meta: pagination_meta(@users),
               adapter: :json,
               status: :ok
      end

      def show
        render json: @user,
               serializer: Api::V1::UserSerializer,
               status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save!
          render json: @user,
                 serializer: Api::V1::UserSerializer,
                 status: :created
        else
          error_response(@user.errors.full_messages)
        end
      end

      def update
        if @user.update(user_params)
          render json: @user,
                 serializer: Api::V1::UserSerializer,
                 status: :ok
        else
          error_response(@user.errors.full_messages)
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation)
      end
    end
  end
end 