class LoadingmaterialsController < ApplicationController

    def new
    @loading = Loading.find(params[:loading_id])
    @loadingmaterial = Loadingmaterial.new
    end

    def create
    @loading = Loading.find(params[:loading_id])
    @loadingmaterial = Loadingmaterial.new(loadingmaterial_params)
    @loadingmaterial.loading = @loading
    if @loadingmaterial.save
      redirect_to delivery_loading_path(@loading.delivery_id, @loading)
    else
      render 'loadings/show'
    end
    end

  private

  def loadingmaterial_params
    params.require(:loadingmaterial).permit(:material_id, :loading_id, :quantity)
  end
end
