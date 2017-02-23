class Product < ActiveRecord::Base
    belongs_to :reliefs
    
   # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    @q        = Product.search(params[:q])
    @products = @q.result(distinct: true)
  end
end
