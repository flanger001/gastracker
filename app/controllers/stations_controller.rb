class StationsController < ApplicationController
  # NB: This requires a user but I have locked down permissions for stations at the moment
  before_action :require_user

  def index
    authorize(Station)
  end

  def show
    authorize(Station)
  end

  def new
    authorize(Station)
    @station = current_user.stations.build
  end

  def edit
    authorize(Station)
  end

  def create
    authorize(Station)
    @station = current_user.stations.build(resource_params)
    if resource.save
      redirect_to resource, :notice => "Station was successfully created."
    else
      render :new
    end
  end

  def update
    authorize(Station)
    if resource.update(resource_params)
      redirect_to resource, :notice => "Station was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize(Station)
    resource.destroy
    redirect_to stations_url, :notice => "Station was successfully destroyed."
  end

  private

  def resource
    @station ||= Station.find(params[:id])
  end

  def collection
    @stations = Station.where(:user_id => current_user.id)
  end

  def resource_params
    params.require(:station).permit(:name, :address, :city, :state, :zip, :phone)
  end
end
