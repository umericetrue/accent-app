class HeibansController < ApplicationController
  def create
    @heiban = current_user.heibans.create(accent_id: params[:accent_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @accent = Accent.find(params[:accent_id])
    @heiban = current_user.heibans.find_by(accent_id: @accent.id)
    @heiban.destroy
    redirect_back(fallback_location: root_path)
  end
end
