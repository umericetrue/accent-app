class AtamadakasController < ApplicationController
  def create
    @atamadaka = Atamadaka.create(user_id: current_user.id, accent_id: params[:accent_id])
    @atamadakas = Atamadaka.where(accent_id: params[:accent_id])
    @accent = Accent.find(params[:accent_id])
  end

  def destroy
    atamadaka = Atamadaka.find_by(user_id: current_user.id, accent_id: params[:accent_id])
    atamadaka.destroy
    @atamadakas = Atamadaka.where(accent_id: params[:accent_id])
    @accent = Accent.find([:accent_id])
  end
end
