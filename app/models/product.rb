class Product < ApplicationRecord
  has_many   :images
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :address
  belongs_to :user
 

  validates :name, :postage, :price, :description, :status, :shipping_date, presence: true
 
  # active_hashでbrandデータを導入する
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand

   # active_hashでsizeデータを導入する
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :size

   # active_hashでconditionデータを導入する
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :condition

    # active_hashでpostageデータを導入する
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :postage

    # active_hashでshipping_methodデータを導入する
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :shipping_method

     # active_hashでshipping_methodデータを導入する
     extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to_active_hash :shipping_date
end
