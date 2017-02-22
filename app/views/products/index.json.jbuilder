json.array!(@products) do |product|
  json.extract! product, :id, :gsname, :gsgoodsSize, :gsgoodsSize, :gsBestbeforeStart, :gs_BestbeforEnd
  json.url product_url(product, format: :json)
end
