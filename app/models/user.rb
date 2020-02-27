class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # フォロー機能
  has_many :active_relationships, class_name: "Relationship",
            foreign_key:"follower_id",
            dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
            foreign_key:"following_id",
            dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50 }

  # フォローをしているかどうか
  def following_by?(user)
    passive_relationships.where(follower_id: user.id).exists?
  end

  # 住所自動入力
    include JpPrefecture
    jp_prefecture :prefecture_code

    def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

  # 住所結合
  def address
    self.prefecture_name + self.address_city + self.address_street
  end

end
