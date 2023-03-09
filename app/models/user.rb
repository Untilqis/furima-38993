class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #テーブルとのアソシエーション
  has_many :items

  #バリデーション
  with_options presence: true do
    
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ , allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ , allow_blank: true }
    validates :date_of_birth
    
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX

  end
end
