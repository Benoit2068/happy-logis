class LoadingsController < ApplicationController
  before_action :set_loading, only: [:show, :edit, :update, :destroy]

  def index
    @loadings = Loading.all
  end

  def show
    authorize @loading
  end

  def new
    authorize @loading
    @loading = Loading.new
  end

  def create
    authorize @loading
    @loading = Loading.new(loading_params)
    @loading.save
    redirect_to loading_path(@loading)
  end

  def edit
    authorize @loading
  end

  def update
    authorize @loading
    @loading.update(loading_params)
    redirect_to loading_path(@loading)
  end

  def destroy
    authorize @loading
    @loading.destroy
    redirect_to loadings_path
  end

  private

  def loading_params
    params.require(:loading).permit(:name, :address, :date)
  end

  def set_loading
    @loading = Loading.find(params[:id])
  end
end
