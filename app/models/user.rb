class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :following_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :followed_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_users, through: :followed_relationships, source: :follower

  has_many :ownerships , foreign_key: "user_id", dependent: :destroy
  has_many :items, through: :ownerships
  
  #has_many :wantsではclass_name: "Want"を指定することで、ownershipsテーブルからtypeがWantであるものを取得
  #このことにより、has_many :want_itemsで、wantしたアイテムの一覧を取得することができます。
  has_many :wants, class_name: "Want", foreign_key: "user_id", dependent: :destroy
  has_many :want_items , through: :wants, source: :item
  
  #ownershipsテーブルからtypeがHaveであるものの一覧がhaves
  #Haveしたアイテムの一覧がhave_itemsで取得
  #(意味)source: :item⇒through: :havesで指定した参照先のクラスHaveに宣言されているbelongs_to :itemのitemを取得する
  has_many :haves, class_name: "Have", foreign_key: "user_id", dependent: :destroy
  has_many :have_items , through: :haves, source: :item

#会員登録
  #名前(フリガナ）は必須入力かつ200文字以内
 validates :furigana , length: { maximum: 200 } , presence: true
 #名前は200文字以内
  validates :name , length: { maximum: 200 } , presence: true
  #電話番号は必須入力かつ2文字以上30文字以下
  validates :tel , length: { minimum: 15 } , presence: true ,numericality: {only_integer: true}
  #faxは必須入力かつ15文字以内 
  validates :fax, length: { minimum: 15 } , presence: true ,numericality: {only_integer: true}
   #郵便番号は必須入力かつ 7 文字以内 
  validates :post_num, length: { minimum: 7 } , presence: true ,numericality: {only_integer: true}
  #都道府県は必須入力かつ 7 文字以内  
  validates :prefectures,  presence: true
  #市区町村は必須入力
  validates :municipality,  presence: true
#番地以下は必須入力
  validates :area,  presence: true
#建物名はアパートマンションなどをなので記入されたら、セッション追加
#かつ2文字以上100文字以下
validates :building, length: { minimum: 2, maximum: 100 } , allow_blank: true
 
  # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following_users.include?(other_user)
  end

  ## TODO 実装
  # ユーザーがこのアイテムをhaveにする
  def have(item)
    haves.find_or_create_by(item_id: item.id)
  end
  
  # ユーザーがアイテムをunhaveにする
  def unhave(item) #itemをwantしている場合true、wantしていない場合falseを返す。
    have = haves.find_by(item_id: item.id)
    have.destroy if have != nil
  end
  
  # あるユーザーアイテムをhaveしたかどうか
  def have?(item) #itemのwantを解除する。
    have_items.include?(item)
  end
  
  def want(item) #itemをwantする。
    wants.find_or_create_by(item_id: item.id)
  end

  def unwant(item) #itemをunwantにする
    want =  wants.find_by(item_id: item.id)
    want.destroy if want != nil
  end

  def want?(item) #ユーザーがitemをwantしてるか？
    want_items.include?(item)
  end
end