class Product < ApplicationRecord
  has_many   :images, dependent: :destroy

  belongs_to :address
  belongs_to :user
  belongs_to :category
  validates :name, :postage_id, :price, :description, :shipping_date_id, presence: true

  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end
end
