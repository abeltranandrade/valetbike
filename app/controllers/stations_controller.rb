class StationsController < ApplicationController

  def index
    @stations = Station.all.order(name: :asc)
  end

  def show
    @station = Station.find_by(identifier: params["id"])
  end

end
