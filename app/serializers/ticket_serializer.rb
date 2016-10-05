class TicketSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :description, :project_id, :created_at, :updated_at,
    :author_id, :state_id

  has_one :state
end
