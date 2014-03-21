class ImgFilesController < ApplicationController
  require 'rubygems'
  require 'mini_magick'
  
  def destroy
    @img=ImgFile.find_by_id(params[:id]).destroy
    @real_estate = RealEstate.find_by_id(@img.real_estate_id)
    @dir="public/img/" + @real_estate.rs_type
    @fn=@dir+"/"+ @real_estate.id.to_s + "_" + @img.file_name.to_s
    File.delete(@fn)
    flash[:success]="Törölve: " + @img.file_name.to_s
    redirect_to real_estate_path(@img.real_estate_id)
  end
  
  def update
    @imf=ImgFile.find_by_id(params[:img_file][:imf_id])
    @imf.file_comment=params[:img_file][:file_comment]
    @imf.save
    flash[:success]="Kép leírás módosítva!"
    redirect_to real_estate_path(params[:img_file][:id])
  end
  
  def resize(f)
    @image=MiniMagick::Image.open(f)
    @image.resize("800 x 600")
    #flash[:success]=@image[:width].to_s + " x " + @image[:height].to_s
    @image
  end

  def saveimg
    @dir="public/img/" + @real_estate.rs_type
    @path=File.join(@dir, @real_estate.id.to_s + "_" + @imf.file_name)
    if File.exist?(@path)
      flash[:error]="Hiba, a dokumentum már létezik!"
    else
      FileUtils.mkdir_p(@dir) unless File.exist?(@dir)
      @img_to_write=resize(params[:img_file][:Upload].path)
      File.open(@path, "wb") { |f| f.write(open(@img_to_write.path).read) }
      flash[:success]=@imf.file_name + " feltöltve!"
      @imf.save!
    end
  end
  
  def create  
    if params[:img_file][:Upload].nil?
      flash[:error]="Nincs mit feltolteni? :)"
    else
      @real_estate=RealEstate.find_by_id(params[:img_file][:id])
      @imf=@real_estate.img_file.new
      @imf.file_comment=params[:img_file][:file_comment]
      @imf.file_name=params[:img_file][:Upload].original_filename
      @imf.user_id=current_user.id
      saveimg
    end
    redirect_to real_estate_path(params[:img_file][:id])
  end
end
