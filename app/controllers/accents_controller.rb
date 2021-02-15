class AccentsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_accent, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :delete]

  def index
    @accents = Accent.includes(:user).order("created_at DESC").limit(10)
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
    @comment = Comment.new
    @comments = @accent.comments.order('created_at DESC')
  end

  def edit
  end

  def update
    @accent.update(accent_params)
    if @accent.valid?
      redirect_to @accent
    else
      render action: :edit
    end
  end

  def destroy
    if @accent.destroy
      redirect_to action: :index
    else
      render action: :show
    end
  end

  def search
    @accents = Accent.search(params[:keyword])
  end

  private

  def accent_params
    params.require(:accent).permit(:word, :word_kana, :part_of_speech_id, :accent_pattern_id, :beat_count_id,
                                   :info).merge(user_id: current_user.id)
  end

  def set_accent
    @accent = Accent.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && (current_user.id == @accent.user.id || current_user.admin?)
  end
end
