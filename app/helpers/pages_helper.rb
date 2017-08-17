module PagesHelper
	def nav_li text, path
		active = (request.path) == path ? :active : nil
		content_tag :li, link_to(text, path, style: 'color:#352065'), class: active
	end

	def get_category_gallery_columns count
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
	
end
