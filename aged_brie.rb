# frozen_string_literal: true

require_relative 'normal_item'

class AgedBrie < NormalItem
  def update
    if expired?
      increase_quality_by(2)
    else
      increase_quality_by(1)
    end
  end
end
