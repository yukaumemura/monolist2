json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :dly_posnum, :dly_prefectures, :dly_municipality, :dly_streetnum, :dly_bill, :dly_contacts, :dly_remarks
  json.url delivery_url(delivery, format: :json)
end
