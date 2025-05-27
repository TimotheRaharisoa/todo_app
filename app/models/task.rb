class Task < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :due_date, presence: true
    validates :completed, inclusion: { in: [true, false] }

    enum :priority, {
        low: 1,
        medium: 2,
        high: 3,
        urgent: 4,
        critical: 5
    }

    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }

    paginates_per 10
end
