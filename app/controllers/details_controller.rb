class DetailsController < ApplicationController
  def create
    @det=Detail.new
    @det.repar=params[:detail][:repar]
    @det.reval=params[:detail][:reval]
    @det.real_estate_id=params[:id]
    @det.save
    flash[:success]="Hozzáadva: " + @det.repar + ", érték: " + @det.reval
    redirect_to edit_detail_path(@det.real_estate_id)
  end
  
  def edit
    @realestate=RealEstate.find_by_id(params[:id])
  end
  
  def update
    @detail_update = Detail.find_by_real_estate_id_and_repar(params[:id], params[:detail][:repar])
    @detail_update.reval=params[:detail][:reval]
    @detail_update.save
    flash[:success]="Sikeresen módositva a(z) \"" + params[:detail][:repar] + "\" elem"
    redirect_to edit_detail_path(params[:id])
  end
end
