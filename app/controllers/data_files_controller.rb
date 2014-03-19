class DataFilesController < ApplicationController
  def uploadFile
  end
  
  def new
  end
  
  def save
    @dir="public/docs/" + @real_estate.rs_type
    @path=File.join(@dir, @real_estate.id.to_s + "_" + @df.file_name)
    if File.open(@path, "wb") { |f| f.write(params[:data_file][:Upload].read) }
      flash[:success]=@df.file_name + " feltöltve!"
      @df.save!
    end
  end
  
  def create  
    if params[:data_file][:Upload].nil?
      flash[:error]="Nincs mit feltolteni? :)"
    else
      @real_estate=RealEstate.find_by_id(params[:data_file][:id])
      @df=@real_estate.data_file.new
      @df.file_comment=params[:data_file][:file_comment]
      @df.file_name=params[:data_file][:Upload].original_filename
      @df.user_id=current_user.id
      self.save
    end
    redirect_to real_estate_path(params[:data_file][:id])
  end
end
