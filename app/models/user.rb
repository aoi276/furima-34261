class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :second_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_kname, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
    validates :second_kname, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
    validates :birthday
  end
    
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end
