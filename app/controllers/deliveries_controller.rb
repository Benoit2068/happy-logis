class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]


  def index
    @deliveries = Delivery.all
  end

  def my_deliveries
    @deliveries = Delivery.where(user_id: current_user, finished: false).order(:startdate)
  end

  def show

    @markers = @delivery.loadings.geocoded.map do |loading|
      {
        lat: loading.latitude,
        lng: loading.longitude
      }
    end

    @loading = loading.new

  end

  def new
    @delivery = delivery.new
  end

  def create
    @delivery = delivery.new(delivery_params)
    @delivery.save
    redirect_to delivery_path(@delivery)
  end

  def edit
  end

  def update
    @delivery.update(delivery_params)
    redirect_to delivery_path(@delivery)
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:name, :startdate, :capacity)
  end

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
end
