ActiveAdmin.register Page do
	menu :priority => 0  
	config.batch_actions = false
	config.sort_order = 'position_asc'

	sortable

	index do
		sortable_handle_column
    column :position, :sortable => :position
    column :name
    column :slug
    column :content
    column :hidden
    default_actions
  end
end
