# frozen_string_literal: true

require_relative 'normal_item'

class BackstagePass < NormalItem
  def update
    increase_quality_by(1)
    increase_quality_by(1) if @item.sell_in < 10
    increase_quality_by(1) if @item.sell_in < 5
    @item.quality -= @item.quality if expired?
  end
end
