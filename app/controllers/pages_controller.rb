class PagesController < ApplicationController
  def portal
    render layout: 'portal'
  end

  def home
  		@products = get_all_category_random_product

  end

  def product
  end

  def about
  end

  def exhibition
  end

  private 

  def get_all_category_random_product
  		result = []
  		Category.all.each do |c|
  			product = c.products[rand(c.products.count)]
  			if product != nil
				result << product
			end
		end
		result
  end

 #  def get_random_product category_id
	# 	products = Category.find(category_id).products
	# 	product = products[rand(products.count)]
	# end

	# def get_category_id_arr
	# 	result = []
	# 	Category.all.each do |c|
	# 		result << c.id
	# 	end
	# 	result
	# end


end
