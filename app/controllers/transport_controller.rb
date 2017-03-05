class TransportController < ApplicationController
  def index
     @transports=Offer.all
     @transport=Offer.new
  end
  
end
