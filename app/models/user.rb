class User < ApplicationRecord
  authenticates_with_sorcery!
  # バリデーション
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, presence: true, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }

end
