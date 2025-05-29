module TasksHelper
  def priority_badge_class(priority)
    base_classes = "py-1 px-3 rounded-full text-xs"
    
    case priority.to_sym
    when :low
      "#{base_classes} bg-gray-200 text-gray-600"
    when :medium
      "#{base_classes} bg-blue-200 text-blue-600"
    when :high
      "#{base_classes} bg-yellow-200 text-yellow-600"
    when :urgent
      "#{base_classes} bg-orange-200 text-orange-600"
    when :critical
      "#{base_classes} bg-red-200 text-red-600"
    else
      "#{base_classes} bg-gray-200 text-gray-600"
    end
  end
end 