class StationsController < ApplicationController
  before_action :require_user

  def index
  end

  def show
  end

  def new
    @station = current_user.stations.build
  end

  def edit
  end

  def create
    @station = current_user.stations.build(resource_params)
    if resource.save
      redirect_to resource, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if resource.update(resource_params)
      redirect_to resource, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to stations_url, notice: 'Station was successfully destroyed.'
  end

  private

  def resource
    @station ||= current_user.stations.find(params[:id])
  end

  def collection
    @stations = current_user.stations.all
  end

  helper_method :resource, :collection

  def resource_params
    params.require(:station).permit(:name, :address, :city, :state, :zip, :phone)
  end

end
