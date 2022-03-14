class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = material.all
  end

  def show
  end

  def new
    @material = material.new
  end

  def create
    @material = material.new(material_params)
    @material.save
    redirect_to material_path(@material)
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