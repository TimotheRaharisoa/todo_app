# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(id:)
    @id = id
  end

  private

  attr_reader :id
  
end
