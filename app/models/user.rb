class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  validates :nickname, presence: true
  validates :email, presence: true, format:{ with: /\A.+[@].+\z/ },uniqueness: true
  validates :password,presence: true, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6}/i}
  validates :last_name,presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name,presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_kana,presence: true, format:{ with: /\A[ァ-ン]+\z/ }
  validates :first_name_kana,presence: true, format:{ with: /\A[ァ-ン]+\z/ }
  validates :birth_day,presence: true
end
