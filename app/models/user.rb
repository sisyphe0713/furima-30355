class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ #英小文字含む、#英大文字含む、数字含む、6文字以上
  VALID_PASSWORD_REGEX =/\A(?=.*?[A-z])(?=.*?[\d])\w{6,}\z/ #英文字含む、数字含む、6文字以上
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, }
end
