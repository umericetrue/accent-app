class OdakasController < ApplicationController
  def create
    @odaka = current_user.odakas.create(accent_id: params[:accent_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @accent = Accent.find(params[:accent_id])
    @odaka = current_user.odakas.find_by(accent_id: @accent.id)
    @odaka.destroy
    redirect_back(fallback_location: root_path)
  end
end
