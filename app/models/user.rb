class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角英数を入力してください' }

  has_many :accents
  has_many :comments
  has_many :atamadakas, dependent: :destroy
  has_many :nakadakas, dependent: :destroy
  has_many :odakas, dependent: :destroy
  has_many :heibans, dependent: :destroy

  def already_atamadaka?(accent)
    atamadakas.exists?(accent_id: accent.id)
  end

  def already_nakadaka?(accent)
    nakadakas.exists?(accent_id: accent.id)
  end

  def already_odaka?(accent)
    odakas.exists?(accent_id: accent.id)
  end

  def already_heiban?(accent)
    heibans.exists?(accent_id: accent.id)
  end
end
