class LoadingsController < ApplicationController
  before_action :set_loading, only: [:show, :edit, :update, :destroy]

  def index
    @loadings = loading.all
  end

  def show
  end

  def new
   @loading = loading.new
  end

  def create
    @loading = loading.new(loading_params)
    @loading.save
    redirect_to loading_path(@loading)
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
    @loading = loading.find(params[:id])
  end
end
