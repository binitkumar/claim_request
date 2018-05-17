class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo

  def show
    send_data @photo.content, :type => @photo.content_type,:disposition => 'inline'
  end

  def set_photo
    @photo = Photo.find params[:id]
  end
end
