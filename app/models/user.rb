class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/
  with_options presence: true do
    validates :nickname
    validates :email,  format: { with: /\A.+[@].+\z/ }, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6}/i }
    validates :last_name,  format: { with: NAME_REGEX}
    validates :first_name,  format: { with: NAME_REGEX}
    validates :last_name_kana,  format: { with: NAME_KANA_REGEX }
    validates :first_name_kana,  format: { with:NAME_KANA_REGEX }
    validates :birth_day
  end
end
