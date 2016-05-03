class GasEntriesController < ApplicationController
  before_action :require_user

  def index
  end

  def dashboard
  end

  def show
  end

  def new
    @resource = current_user.gas_entries.build
    resource.date = Date.today
  end

  def create
    @resource = current_user.gas_entries.build(resource_params)
    if resource.station
      resource.station.user = current_user
    end
    if resource.save
      flash[:success] = 'Fill-up added successfully!'
      redirect_to gas_entries_path
    else
      flash[:error] = 'Unable to save fill-up!'
      render :new
    end
  end

  def edit
  end

  def update
    if resource.update(resource_params)
      flash[:success] = 'Fill-up edited successfully!'
      redirect_to gas_entries_path
    else
      flash[:error] = 'Unable to edit fill-up!'
      render :edit
    end
  end

  def destroy
    resource.destroy
    flash[:success] = 'Fill-up deleted successfully!'
    redirect_to gas_entries_path
  end

  protected

  def resource_params
    params.require(:gas_entry).permit(
      :date,
      :odometer,
      :gallons,
      :distance,
      :notes,
      :cost,
      :station_id,
      :vehicle_id,
      :price_per_gallon,
      :photo,
      :remove_photo,
      { :station_attributes => [:id, :name, :address, :city, :state, :zip, :phone] })
  end

  def collection
    @collection ||= GasEntryCollectionPresenter.new({ collection: current_user.gas_entries.only_this_year, user: current_user, view: view_context })
  end

  def resource
    @resource ||= GasEntryPresenter.new({ resource: GasEntry.find(params[:id]), user: current_user, view: view_context })
  end

  # TODO: These know too much
  def stations
    @stations = current_user.stations.all
  end

  def vehicles
    @vehicles = current_user.vehicles.all
  end

  helper_method :resource, :collection, :stations, :vehicles

end
