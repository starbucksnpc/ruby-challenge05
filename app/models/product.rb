class Product < ApplicationRecord
  belongs_to :category
  validates :title, :price, :stock_quantity, :category_id, presence: true
end
