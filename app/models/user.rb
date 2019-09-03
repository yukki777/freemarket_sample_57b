class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_one :address
  accepts_nested_attributes_for :address
  
  validates :password, length: { minimum: 7, maximum: 128}
  validates :password_confirmation, length: { minimum: 7, maximum: 128}
  validates :email,  uniqueness: true
  validates :nickname, :email, :password, :password_confirmation, :first_name, :first_name_kana ,:family_name, :family_name_kana, presence: true
  
end
