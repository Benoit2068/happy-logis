class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]


  def index
    @deliveries = Delivery.all
  end

  def my_deliveries
    @deliveries = Delivery.where(user_id: current_user, finished: false).order(:startdate)
  end

  def show
    @loading = Loading.new
    @markers = @delivery.loadings.order("id ASC").geocoded.map do |loading|
      {
        lat: loading.latitude,
        lng: loading.longitude,
        info_marker: render_to_string(partial: "info_marker_deliveries", locals: { loading: loading }),
      }
    end

  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
  end

  def update
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:name, :startdate, :capacity, :user_id)
  end

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
end
