# frozen_string_literal: true

require_relative 'item'

class NormalItem
  def initialize(item)
    @item = item
  end

  def update
    if expired?
      decrease_quality_by(2)
    else
      decrease_quality_by(1)
    end
  end

  protected

  def expired?
    @item.sell_in.negative?
  end

  def increase_quality_by(factor)
    @item.quality += factor
    enforce_quality_of_an_item_is_not_more_than(50)
  end

  def decrease_quality_by(factor)
    @item.quality -= factor
    enforce_quality_of_an_item_is_never_negative
  end

  private

  def enforce_quality_of_an_item_is_not_more_than(limit)
    @item.quality = limit if @item.quality > limit
  end

  def enforce_quality_of_an_item_is_never_negative
    @item.quality = 0 if @item.quality.negative?
  end
end
