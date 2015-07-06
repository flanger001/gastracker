class GasEntriesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include GasEntryMethods
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
    params.require(:gas_entry).permit(:date, :odometer, :gallons, :distance, :notes, :cost, :station_id,
      { :station_attributes => [:id, :name, :address, :city, :state, :zip, :phone] })
  end

  def collection
    @collection = current_user.gas_entries.most_recent.this_year
  end

  def resource
    @resource ||= current_user.gas_entries.find(params[:id])
  end

  helper_method :resource, :collection

end
