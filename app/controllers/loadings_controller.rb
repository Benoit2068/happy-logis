class LoadingsController < ApplicationController
  before_action :set_loading, only: [:show, :edit, :update, :destroy]

  def index
    @loadings = Loading.all
  end

  def show
    #@material = Material.new
  end

  def new
    @delivery = Delivery.find(params[:delivery_id])
    @loading = Loading.new
  end

  def create
    @loading = Loading.new(loading_params)
    @loading.save
    redirect_to delivery_loadings_path
  end

  def edit
  end

  def update
    @loading.update(loading_params)
    redirect_to loading_path(@loading)
  end

  def destroy
    @loading.destroy
    redirect_to loadings_path
  end

  private

  def loading_params
    params.require(:loading).permit(:name, :address, :date, :delivery_id)
  end

  def set_loading
    @loading = Loading.find(params[:id])
  end
end
