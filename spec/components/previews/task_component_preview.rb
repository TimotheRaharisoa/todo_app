class TaskComponentPreview < ViewComponent::Preview
  def default
    task = Task.new(
      title: "Example Task",
      description: "This is an example task description",
      priority: :medium,
      due_date: 1.week.from_now,
      completed: false
    )
    render(TaskComponent.new(task: task))
  end

  def completed
    task = Task.new(
      title: "Completed Task",
      description: "This task has been completed",
      priority: :high,
      due_date: 1.day.ago,
      completed: true
    )
    render(TaskComponent.new(task: task))
  end

  def with_different_priorities
    render_with_template(
      template: "task_component_preview/with_different_priorities"
    )
  end
end 