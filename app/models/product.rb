class Product < ApplicationRecord
  has_many   :images, dependent: :destroy

  belongs_to :address
  belongs_to :user
  has_many   :categories
  validates :name, :postage_id, :price, :description, :shipping_date_id, presence: true
end
