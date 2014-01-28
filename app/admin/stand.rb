ActiveAdmin.register Stand do
  menu :priority => 1
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
		#column "Seo title" do |i| 
    	#i.seo.title
    #end
		column :hidden
		default_actions
	end  

	form do |f|
  	f.inputs do
  		f.input :name
  		f.input :slug 
  		f.input :position 
			f.input :content   
  		f.input :hidden
      f.input :image, as: :file

  		f.has_many :stand_types do |st|
				st.input :name
	  		st.input :slug 
	  		st.input :position 
				st.input :content 
        st.input :complect_info  
        st.input :image, as: :file
	  		st.input :hidden
        
  			st.has_many :stand_benefits do |sb|
  				sb.input :title
  				sb.input :content
  			end

  			st.has_many :stand_options do |sb|
  				sb.input :stand_price
 					sb.input :print_price
  				sb.input :size

  			end
  		end 
  	f.actions
  	end
	end
end

