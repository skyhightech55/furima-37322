class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ },
            presence: true
  validates :first_name,
            format: { with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/ },
            presence: true
  validates :family_name_kana,
            format: { with: /\A([ァ-ン]|ー)+\z/ },
            presence: true
  validates :first_name_kana,
            format: { with: /\A([ァ-ン]|ー)+\z/ },
            presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Password is invalid' }
  
end
