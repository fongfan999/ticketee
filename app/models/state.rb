class State < ActiveRecord::Base
  def to_s
    name
  end

  def make_default!
    State.update_all(default: false)
    update!(default: true)
  end
end
