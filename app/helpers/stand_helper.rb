module StandHelper

	def menu_item_state(stand)
		slug = params[:slug]
		if stand.slug == slug || stand.stand_types.find{|p| p.slug == slug }
			'current'
		end
	end
end