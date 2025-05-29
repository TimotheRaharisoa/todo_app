# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(classes: "")
    @classes = classes
  end

  private

  attr_reader :classes

  def card_classes
    ["card", classes].join(" ").strip
  end
end 