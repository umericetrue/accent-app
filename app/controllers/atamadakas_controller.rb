class AtamadakasController < ApplicationController
  def create
    @atamadaka = current_user.atamadakas.create(accent_id: params[:accent_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @accent = Accent.find(params[:accent_id])
    @atamadaka = current_user.atamadakas.find_by(accent_id: @accent.id)
    @atamadaka.destroy
    redirect_back(fallback_location: root_path)
  end
end
