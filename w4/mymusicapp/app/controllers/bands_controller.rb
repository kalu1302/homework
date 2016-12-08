class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to band_url(@band.id)
    else
      render :new
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
