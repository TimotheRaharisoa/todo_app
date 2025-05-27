module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :title, :description, :priority, :due_date, :completed, :created_at, :updated_at

      belongs_to :user

      def completed
        object.completed?
      end

      def priority
        object.priority.to_sym
      end
    end
  end
end 