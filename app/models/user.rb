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

  def already_atamadakas?(accent)
    self.atamadakas.exists?(accent_id: accent.id)
  end
end
