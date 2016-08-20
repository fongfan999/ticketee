class CommentPolicy < TicketPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
