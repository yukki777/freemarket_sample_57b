class Product < ApplicationRecord
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :address
  belongs_to :user
  belongs_to :category
  validates :name, :postage_id, :price, :description, :shipping_date_id, presence: true

  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end

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
