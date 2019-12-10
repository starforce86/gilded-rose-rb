# frozen_string_literal: true

require_relative 'normal_item'

class ConjuredItem < NormalItem
  def update
    decrease_quality
    decrease_quality if expired?
  end
end
