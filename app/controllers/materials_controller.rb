class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = Material.all
  end

  def show
  end

  def new
    @loading = Loading.find(params[:loading_id])
    @material = Material.new
  end

  def create
    @loading = Loading.find(params[:loading_id])
    @material = Material.new(material_params)
    @material.loading = @loading
    if @material.save
      redirect_to loading_path(@loading)
    else
      render 'loadings/show'
    end
  end

  def edit
  end

  def update
    @material.update(material_params)
    redirect_to material_path(@material)
  end

  def destroy
    @material.destroy
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:name, :quantity)
  end

  def set_material
    @material = material.find(params[:id])
  end
end
