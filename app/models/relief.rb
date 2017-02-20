class Relief < ActiveRecord::Base
    #バリで設定
    #品名は200文字以内で必須項目
    validates :gs_name, length: { maximum: 200 }, presence: true
    
    # サイズ種目は200文字以内で必須項目
    validates:gs_sizeEvent,  presence: true
    
    # サイズの大きさは200文字以内で必須項目
    validates:gs_goodsSize,  presence: true, length: { maximum: 25 }
    
    #段ボール重量
    validates :gs_dbweight, length: { maximum: 100 }, numericality: { only_integer: true },allow_blank: true
    
    #段ボール１箱入数
    validates  :gs_dbboxcount, length: { maximum: 100 }, numericality: { only_integer: true },allow_blank: true
    
    #段ボールサイズcm
    validates :gs_dbboxsize, length: { maximum: 100 },allow_blank: true
    
    #賞味期限開始日時
    validates :gs_BestbeforeStart,length: { maximum: 100 }, allow_blank: true
    
    #賞味期限終了日時
    validates:gs_BestbeforEnd, length: { maximum: 100 },allow_blank: true
    
    #物資詳細在庫数は必須で数字型のみ対応
    validates:gs_NowNum,  presence: true, numericality: { only_integer: true }
    
    #物資詳細不足数は必須で数字型のみ対応
    validates:gs_shortages,  presence: true, numericality: { only_integer: true }
    
    #物資詳細備考は入力されたら追加
    validates:goos_note,  numericality: { only_integer: true }
    
end
