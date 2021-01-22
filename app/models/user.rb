class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :birthday, presence: true

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ #英小文字含む、#英大文字含む、数字含む、6文字以上
  VALID_PASSWORD_REGEX =/\A(?=.*?[A-z])(?=.*?[\d])\w{6,}\z/ #英文字含む、数字含む、6文字以上
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, }
end
