module Api
  module V1
    class TasksController < BaseController
      before_action :set_task, only: [:show, :update, :destroy]

      def index
        @tasks = Task.page(params[:page]).per(params[:per_page] || 10)
        
        respond_to do |format|
          format.html # renders index.html.erb
          format.json do
            render json: @tasks,
                   each_serializer: Api::V1::TaskSerializer,
                   meta: pagination_meta(@tasks),
                   status: :ok
          end
        end
      end

      def show
        respond_to do |format|
          format.html # renders show.html.erb
          format.json do
            render json: @task,
                   serializer: Api::V1::TaskSerializer,
                   status: :ok
          end
        end
      end

      def create
        @task = Task.new(task_params)
        if @task.save!
          respond_to do |format|
            format.html { redirect_to api_v1_task_path(@task), notice: 'Task was successfully created.' }
            format.json do
              render json: @task,
                     serializer: Api::V1::TaskSerializer,
                     status: :created
            end
          end
        else
          respond_to do |format|
            format.html { render :new }
            format.json { error_response(@task.errors.full_messages) }
          end
        end
      end

      def update
        if @task.update!(task_params)
          respond_to do |format|
            format.html { redirect_to api_v1_task_path(@task), notice: 'Task was successfully updated.' }
            format.json do
              render json: @task,
                     serializer: Api::V1::TaskSerializer,
                     status: :ok
            end
          end
        else
          respond_to do |format|
            format.html { render :edit }
            format.json { error_response(@task.errors.full_messages) }
          end
        end
      end

      def destroy
        @task.destroy
        respond_to do |format|
          format.html { redirect_to api_v1_tasks_path, notice: 'Task was successfully deleted.' }
          format.json { head :no_content }
        end
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