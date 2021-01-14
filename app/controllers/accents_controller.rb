class AccentsController < ApplicationController
  def index
  end

  def new
    @accent = Accent.new
  end

  def create
    @accent = Accent.new(accent_params)
    if @accent.valid?
      @accent.save
      redirect_to @accent
    else
      render action: :new
    end
  end

  def show
    @accent = Accent.find(params[:id])
  end

  private
  def accent_params
    params.require(:accent).permit(:word, :word_kana, :part_of_speech_id, :accent_pattern_id, :beat_count_id, :info).merge(user_id: current_user.id)
  end
end
