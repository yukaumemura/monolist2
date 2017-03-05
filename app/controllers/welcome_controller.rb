class WelcomeController < ApplicationController
  def index
    ＠d = Delivery.all
    @items = Item.all.order("updated_at DESC").limit(30)
  end
end
