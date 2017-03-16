class GallsController < ApplicationController

  def index
    @gall = Gall.all
  end

end
