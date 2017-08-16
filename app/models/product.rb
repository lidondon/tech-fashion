class Product < ApplicationRecord
	has_many :product_photos, dependent: :destroy
	belongs_to :category
	accepts_nested_attributes_for :product_photos 
	validates :name, :category_id, :number, presence: true
end
