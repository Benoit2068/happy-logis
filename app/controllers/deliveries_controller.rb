class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  def index
    @deliveries = delivery.all
  end

  def show
    authorize @delivery
  end

  def new
    authorize @delivery
    @delivery = delivery.new
  end

  def create
    authorize @delivery
    @delivery = delivery.new(delivery_params)
    @delivery.save
    redirect_to delivery_path(@delivery)
  end

  def edit
  end

  def update
    authorize @delivery
    @delivery.update(delivery_params)
    redirect_to delivery_path(@delivery)
  end

  def destroy
    authorize @delivery
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
