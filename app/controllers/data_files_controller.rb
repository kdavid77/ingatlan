class DataFilesController < ApplicationController
  def destroy
    @df=DataFile.find_by_id(params[:id]).destroy
    @real_estate = RealEstate.find_by_id(@df.real_estate_id)
    @dir="public/docs/" + @real_estate.rs_type
    @fn=@dir+"/"+ @real_estate.id.to_s + "_" + @df.file_name.to_s
    File.delete(@fn)
    flash[:success]="Sikeresen törölve: " + @df.file_name.to_s
    redirect_to real_estate_path(@df.real_estate_id)
  end
  
  def update
    @df=DataFile.find_by_id(params[:data_file][:df_id])
    @df.file_comment=params[:data_file][:file_comment]
    @df.save
    flash[:success]=@df.file_name + " dokumentum leirasa módosult: " + @df.file_comment
    redirect_to real_estate_path(params[:data_file][:id])
  end
  
  def savedoc
    @dir="public/docs/" + @real_estate.rs_type
    @path=File.join(@dir, @real_estate.id.to_s + "_" + @df.file_name)
    if File.exist?(@path)
      flash[:error]="Hiba, a dokumentum már létezik!"
      @df.save!
    else
      FileUtils.mkdir_p(@dir) unless File.exist?(@dir)
      File.open(@path, "wb") { |f| f.write(params[:data_file][:Upload].read) }
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
      self.savedoc
    end
    redirect_to real_estate_path(params[:data_file][:id])
  end
end
