class MarketInfosController < ApplicationController
  def new
  end
  
  def create
    @real_estate=RealEstate.find_by_id(params[:market_info][:real_estate_id])
    if params[:market_info][:value].to_i==0
      flash[:error]="Ilyen olcsó?"
    elsif params[:market_info][:info_date]<params[:market_info][:event_date]
      flash[:error]="Jövőbelátás?"
    elsif params[:market_info][:info_source].empty?
      flash[:error]="Isteni sugallat?"
    elsif params[:market_info][:info_status].empty?
      flash[:error]="Szolgálatos táltos?"
    elsif params[:market_info][:info_contact].empty?
      flash[:error]="Telepátia?"
    else
      @market_info=MarketInfo.new
      @market_info.md_type=TRtype.index(params[:market_info][:md_type])
      @market_info.info_date=params[:market_info][:info_date]
      @market_info.event_date=params[:market_info][:event_date]
      @market_info.info_source=params[:market_info][:info_source]
      @market_info.info_status=params[:market_info][:info_status]
      @market_info.info_contact=params[:market_info][:info_contact]
      @market_info.real_estate_id=params[:market_info][:real_estate_id]
      @market_info.value=params[:market_info][:value]
      @market_info.value_type=TRval_type.index(params[:market_info][:value_type])
      @market_info.user_id=current_user.id
      @market_info.save
      flash[:success]="Piaci információ elmentve!"
    end
    redirect_to @real_estate
  end
  
end
