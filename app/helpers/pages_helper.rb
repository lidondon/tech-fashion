module PagesHelper
	def nav_li text, path, id = nil
		active = (request.path) == path ? :active : nil
		content_tag :li, link_to(text, path, style: 'color:#352065'), class: active
	end

	def category_gallery_columns count
		case count
		when 1
			[1]
		when 2
			[2]
		when 3
			[3]
		when 4
			[2, 2]
		when 5
			[2, 3]
		when 6
			[3, 3]
		when 7
			[3, 4]
		end
	end
	
	# for multiple carousel start
	def multiple_carousel_items products, index
		result = nil
		if products != nil && products.respond_to?(:each) && products.count > 0
			result = []
			if products.count == 1 
				result << multiple_carousel_item(products, index)
			elsif products.count == 2
				result << multiple_carousel_item(products, index)
				result << multiple_carousel_item(products, get_circle_next_index(products.count, index))
			else
				result << multiple_carousel_item(products, index)
				result << multiple_carousel_item(products, get_circle_next_index(products.count, index))
				result << multiple_carousel_item(products, get_circle_next_index(products.count, index, 2))
			end
		end
		result
	end

	def multiple_carousel_item products, index
		img = image_tag(products[index].product_photos[0].image_url(:thumb), class: "img-responsive thumbnail")
		content_tag :div, img, class: "col-xs-4", :'data-toggle' => "modal", :'data-target' => '#productModal', :'data-name' => "#{products[index].name}", 
			:'data-size' => "#{products[index].size}", :'data-number' => "#{products[index].number}", :'data-description' => "#{products[index].description}",
			:'data-photo' => "#{products[index].product_photos[0].image_url}"
	end

	def get_circle_next_index count, index, jump = 1
		(index + jump) % count
	end

	def multiple_carousel_item_class index
		index == 0 ? "item active" : 'item'
	end
	# for multiple carousel end
end
