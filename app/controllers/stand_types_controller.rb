class StandTypesController < ApplicationController
	def show
		@stands = StandType.find_by_slug(params[:slug]) || StandType.find(params[:slug])
		render params[:slug] if controller_view_exists?(params[:slug])
		@options = @stands.stand_options
	end

	def view_exists?(view)
		File.exists? Rails.root.join("app", "views", view)
	end

	def controller_view_exists?(name)
		view_exists?("#{params[:controller]}/#{name}.html.erb")
	end

end
