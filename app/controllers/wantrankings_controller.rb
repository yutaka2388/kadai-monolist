class WantrankingsController < ApplicationController
  def want
    @wantranking_counts = Want.wantranking
    @items = Item.find(@wantranking_counts.keys)
  end
end
