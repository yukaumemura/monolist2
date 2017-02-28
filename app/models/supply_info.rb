class SupplyInfo < ActiveRecord::Base
#物情配信登録(災害物資の仕分けで発生した不足余剰品が発生した場合に配信するページ）のバリデ
#配信日時はdatatime型で必須


#物資名は文字型で必須項目
validates :shs_name, presence: true   
    
#希望物資種目は文字型で必須
#こちらは服などの性別や赤ちゃん関連に使い、ない場合はなしとします。
validates :shs_sizeEvent, presence: true
#希望物資サイズは文字型もし文字があれば登録する
#（服、ペットボトルなどのサイズがある場合）
validates :shs_goodsSize, presence: true  

#不足品段ボール数は数字型で入力項目は必須
#こちらは支援物資が段ボールであった場合に入力
validates :shs_Lackofgdsdbox, presence: true,numericality: { only_integer: true }

#不足品単数は数字型で入力必須
#こちらは支援物資が段ボールではない場合に入力
validates :shs_Lackofgds, presence: true,numericality: { only_integer: true }

#余剰品段ボール数は数字型で入力項目は必須
#こちらは支援物資が段ボールであった場合に入力
validates :shs_Surplusitemdbox, presence: true,numericality: { only_integer: true }

#余剰品単数は数字型で入力必須
#こちらは支援物資が段ボールではない場合に入力
validates :shs_Surplusitem, presence: true,numericality: { only_integer: true }

#備考は文字型で何かあれば記入
validates :shs_note, length: { minimum: 2, maximum: 300 }, allow_blank: true


end
