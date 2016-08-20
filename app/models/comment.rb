class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: "User"

  validates :text, presence: true

  scope :persisted, -> { where.not(id: nil) }

  delegate :project, to: :ticket
end
