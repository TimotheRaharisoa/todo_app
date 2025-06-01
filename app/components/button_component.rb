# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base

    def initialize(label:, type: 'button', classes: '', url: nil)
      super()
      @url = url
      @url ||= '#'
      @label = label
      @type = type
      @classes = classes
    end

    private

    attr_reader :label, :type, :classes

    def button_classes
      ["btn", classes].join(" ").strip
    end
end
