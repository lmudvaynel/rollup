class PagesController < ApplicationController

  def show
    @page = Page.find_by_slug(params[:slug]) || Page.find(params[:slug])
    @stands = Stand.where("position<?", 5)
    render params[:slug] if controller_view_exists?(params[:slug])
  end

  private

  def view_exists?(view)
    File.exists? Rails.root.join("app", "views", view)
  end

  def controller_view_exists?(name)
    view_exists?("#{params[:controller]}/#{name}.html.erb")
  end
end
