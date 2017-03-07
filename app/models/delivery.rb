class Delivery < ActiveRecord::Base
    #delibery.rb
    has_many :supply_infos , through: :user
    belongs_to :user
   #お届け先郵便番号は文字型で必須
validates :dly_name, presence: true  
    #お届け先郵便番号は文字型で必須
validates :dly_posnum, presence: true

#お届け先都道府県は文字型で必須
validates :dly_prefectures, presence: true

#お届け先市区町村
validates :dly_municipality, presence: true

#お届け先番地以下
validates :dly_streetnum, presence: true

#お届け先建物名
validates :dly_bill, length: { minimum: 2, maximum: 2000 }, allow_blank: true

#お届け先の連絡先
validates :dly_contacts, presence: true

#お届け先備考
validates :dly_remarks, length: { minimum: 2, maximum: 2000 }, allow_blank: true

end
