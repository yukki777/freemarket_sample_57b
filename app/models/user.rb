class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  # サインイン時にユーザーの正当性を検証するためにパスワードを暗号化してDBに登録します。認証方法としてはPOSTリクエストかHTTP Basic認証が使えます。
  # 登録処理を通してユーザーをサインアップします。また、ユーザーに自身のアカウントを編集したり削除することを許可します。
  # パスワードをリセットし、それを通知します。
  # 保存されたcookieから、ユーザーを記憶するためのトークンを生成・削除します。
  # Emailやパスワードのバリデーションを提供します。独自に定義したバリデーションを追加することもできます

  has_many :products
  has_one :address
  accepts_nested_attributes_for :address
  
  validates :password, length: { minimum: 7, maximum: 128}
  validates :password_confirmation, length: { minimum: 7, maximum: 128}
  validates :email,  uniqueness: true
  validates :nickname, :email, :password, :password_confirmation, :first_name, :first_name_kana ,:family_name, :family_name_kana, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.uid
      user.nickname = auth.info.name
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.family_name = auth.info.last_name
      user.encrypted_password = Devise.friendly_token[0, 20]
    end
  end
end
