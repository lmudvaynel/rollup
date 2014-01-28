ActiveAdmin.register StandType do
	menu :priority => 2
  config.batch_actions = false
  config.sort_order = 'position_asc'

  sortable

	index do
		sortable_handle_column
		column :position
		column "Image" do |stand|
      image_tag stand.image, class: 'my_image_size'
    end
		column :name
		column :slug
		column :content
		default_actions
	end

	form do |f|
  	f.inputs do
  		f.input :stand_id, as: :select,
              collection: Hash[Stand.all.map{|stand| ["#{stand.name}-#{stand.id}", stand.id]}] 
  		f.input :name
  		f.input :slug 
  		f.input :position 
			f.input :content   
			f.input :complect_info
			f.input :image, as: :file
  		f.input :hidden

			f.has_many :stand_benefits do |sb|
				sb.input :title
				sb.input :content
			end

			f.has_many :stand_options do |so|
				so.input :stand_price
				so.input :print_price
				so.input :size

			end 
  	f.actions
  	end
	end
end
