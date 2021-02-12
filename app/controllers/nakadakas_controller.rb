class NakadakasController < ApplicationController
  def create
    @nakadaka = current_user.nakadakas.create(accent_id: params[:accent_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @accent = Accent.find(params[:accent_id])
    @nakadaka = current_user.nakadakas.find_by(accent_id: @accent.id)
    @nakadaka.destroy
    redirect_back(fallback_location: root_path)
  end
end
