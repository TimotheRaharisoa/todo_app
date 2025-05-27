class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :confirmable, :lockable, :timeoutable, :trackable

    has_many :tasks

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :active, inclusion: { in: [true, false] }

end