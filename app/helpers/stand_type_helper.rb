module StandTypeHelper

	def image_link(stand)
		return image_tag Stand.find(stand.stand_id).image if stand.image.url.match("missing.png")
		return image_tag stand.image
	end

	def content(stand)
		return Stand.find(stand.stand_id).content
		return stand.content
	end
end