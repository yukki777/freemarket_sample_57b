class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :products
  has_one :address
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, length: { minimum: 7, maximum: 128}
  validates :password_confirmation, length: { minimum: 7, maximum: 128}
  validates :email,  uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :nickname, :email, :password, :password_confirmation, :first_name, :first_name_kana ,:family_name, :family_name_kana, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.nickname = auth.info.name
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.family_name = auth.info.last_name
      user.encrypted_password = Devise.friendly_token[0, 20]
      user.password = Devise.friendly_token[0, 20]
      # binding.pry
    end
  end
end
