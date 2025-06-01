module Api
  module V1
    class TasksController < BaseController
      before_action :set_task, only: [:show, :update, :destroy]

      def index
        @tasks = Task.page(params[:page]).per(params[:per_page] || 10)
        render json: @tasks,
               each_serializer: Api::V1::TaskSerializer,
               meta: pagination_meta(@tasks),
               status: :ok
      end

      def show
        render json: @task,
               serializer: Api::V1::TaskSerializer,
               status: :ok
      end

      def create
        @task = Task.new(task_params)
        if @task.save
          render json: @task,
                 serializer: Api::V1::TaskSerializer,
                 status: :created
        else
          error_response(@task.errors.full_messages)
        end
      end

      def update
        if @task.update(task_params)
          render json: @task,
                 serializer: Api::V1::TaskSerializer,
                 status: :ok
        else
          error_response(@task.errors.full_messages)
        end
      end

      def destroy
        @task.destroy
        head :no_content
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :description, :priority, :due_date, :completed, :user_id)
      end
    end
  end
end 