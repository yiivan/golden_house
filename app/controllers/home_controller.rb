class HomeController < ApplicationController
  def index
    render :index, layout: "home_layout"
  end
end
