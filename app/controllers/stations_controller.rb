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
      flash[:success] = "Station was successfully created."
      redirect_to resource
    else
      render :new
    end
  end

  def update
    authorize(Station)
    if resource.update(resource_params)
      flash[:success] = "Station was successfully updated."
      redirect_to resource
    else
      render :edit
    end
  end

  def destroy
    authorize(Station)
    resource.destroy
    flash[:success] = "Station was successfully destroyed."
    redirect_to stations_path
  end

  private

  def resource
    @resource ||= Station.find(params[:id])
  end

  def collection
    @collection ||= Station.with_user_visits(current_user)
  end

  def resource_params
    params.require(:station).permit(:name, :address, :city, :state, :zip, :phone)
  end
end
