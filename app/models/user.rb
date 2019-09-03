class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_one :address
  has_one :wallet
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
