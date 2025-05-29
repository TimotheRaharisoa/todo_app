# frozen_string_literal: true

class TaskComponent < ViewComponent::Base
  include TasksHelper
  
  def initialize(task:)
    @task = task
  end

  def status_classes
    task.completed? ? 'text-green-600' : 'text-yellow-600'
  end

  def status_text
    task.completed? ? '✔️ Done' : '⏳ To Do'
  end

  def formatted_date
    task.due_date.strftime("%Y-%m-%d")
  end

  private

  attr_reader :task
end
