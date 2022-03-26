class LoadingsController < ApplicationController
  before_action :set_loading, only: [:show, :edit, :update, :destroy, :toggle]

  def index
     @loadings = Loading.all
  end

  def show
    @markers = [{
      lat: @loading.latitude,
      lng: @loading.longitude
    }]
    #@material = Material.new
  end

  def new
    @delivery = Delivery.find(params[:delivery_id])
    @loading = Loading.new
  end

  def create
    @loading = Loading.new(loading_params)
    @delivery = Delivery.find(params[:delivery_id])
    @loading.delivery_id = @delivery.id
    @loading.save
    redirect_to delivery_path(@loading.delivery_id)
  end

  def edit
  end

  def update
    @loading.update(loading_params)
    redirect_to loading_path(@loading)
  end

  def destroy
    @loading.destroy
    redirect_to delivery_path(@loading.delivery_id)
  end

  def toggle
    @loading.toggle(:done)
    @loading.save
  end

  private

  def loading_params
    params.require(:loading).permit(:name, :address, :date)
  end

  def set_loading
    @loading = Loading.find(params[:id])
  end
end
