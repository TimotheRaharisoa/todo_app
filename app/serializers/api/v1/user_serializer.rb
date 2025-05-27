module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :username, :first_name, :last_name, :active

      has_many :tasks
    end
  end
end 