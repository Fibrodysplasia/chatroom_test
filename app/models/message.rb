class Message < ApplicationRecord
    belongs_to :user
    validates :body, presence: true
    after_create_commit {broadcast_append_to "messages"}
    scope :custom_display, -> { order(:created_at).last(10) }
end
