class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook] 
         
        #  %i[facebook google_oauth2]

         # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      # first_or_create  whereメソッドと併用することで、検索条件に合致するレコードが存在する場合にはそのレコードを参照し、無ければ検索条件の内容で新しいレコードを新規保存してくれます。返り値は参照したレコードもしくは新規作成したレコードです。
      # 中身↓
      # def first_or_create(attributes = nil, options = {}, &block)
      #   first || create(attributes, options, &block)
      # end

      # auth モデル？
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      # ユーザーモデルに名前があると仮定します 
      user.image = auth.info.image
      # ユーザーモデルに画像があると仮定します
      # binding.pry
    end
  end
end

