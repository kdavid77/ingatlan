class RealEstatesController < ApplicationController
  def new
    @real_estate=RealEstate.new
  end
  
  def create
    @real_estate=RealEstate.new(real_estate_params)
    if @real_estate.address.empty?
      flash.now[:error]="Kb. hol van a " + @real_estate.locality + " helységben?"
      render 'new'
    elsif @real_estate.description.empty?
      flash.now[:error]="Még valamit róla?"
      render 'new'
    elsif
      flash.now[:success]="Bejegyzés létrehozva, gratula! :)"
      @real_estate.save
      render 'new'
    end
  end

  def show
    @real_estate=RealEstate.find_by_id(params[:id])
  end

  def edit
    @real_estate=RealEstate.find_by_id(params[:id])
  end

  def update
    @real_estate=RealEstate.find_by_id(params[:id])
    if (@real_estate.update_attributes(real_estate_params))
      flash[:success]="Szerkesztve"
      redirect_to @real_estate
    else
      render 'edit'
    end
  end

  def index
    @filter = []
    if params[:tipus] && params[:tipus]!=""
      @filter << ["rs_type='#{params[:tipus]}'"]
    end
    if params[:telepules] && params[:telepules]!=""
      @filter << ["locality='#{params[:telepules]}'"]
    end
    @real_estate_list=RealEstate.where(@filter.join(" AND "))
  end
  
  private
  
    def real_estate_params
      params.require(:real_estate).permit(:rs_type, :locality, :address, :description, :surface, :area)
    end
end
