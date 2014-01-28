class StandsController < ApplicationController
	def show
		@stand = Stand.find(params[:id])
		render params[:id] if controller_view_exists?(params[:id])
	end

	def view_exists?(view)
		File.exists? Rails.root.join("app", "views", view)
	end

	def controller_view_exists?(name)
		view_exists?("#{params[:controller]}/#{name}.html.erb")
	end

end
