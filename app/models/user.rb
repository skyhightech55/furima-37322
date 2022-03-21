class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :family_name, presence: true
  validate  :family_name, /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true
  validate  :first_name, /\A[ぁ-んァ-ン一-龥]/
  validates :family_name_kana, presence: true
  validate  :family_name_kana, /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true
  validate  :first_name_kana, /\A[ァ-ヶー－]+\z/
  validates :birthday, presence: true
end
