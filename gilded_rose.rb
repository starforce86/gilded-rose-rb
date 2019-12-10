# frozen_string_literal: true

require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'normal_item'

class GildedRose
  @items = []

  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  AGED_BRIE = 'Aged Brie'

  def initialize
    @items = []
    @items << Item.new('+5 Dexterity Vest', 10, 20)
    @items << Item.new('Aged Brie', 2, 0)
    @items << Item.new('Elixir of the Mongoose', 5, 7)
    @items << Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
    @items << Item.new('Sulfuras, Hand of Ragnaros', -1, 80)
    @items << Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
    @items << Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
    @items << Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)
    @items << Item.new('Conjured Mana Cake', 3, 6)
  end

  def update_quality
    @items.each do |item|
      next if item.name == SULFURAS

      update_number_of_days_left_to_sell(item)
      update_quality_for(item)
    end
  end

  def update_quality_for(item)
    if item.name == AGED_BRIE
      aged_brie = AgedBrie.new(item)
      aged_brie.update
    elsif item.name == BACKSTAGE_PASSES
      backstage = BackstagePass.new(item)
      backstage.update
    else
      normal_item = NormalItem.new(item)
      normal_item.update
    end
  end

  def update_number_of_days_left_to_sell(item)
    item.sell_in -= 1
  end
end
