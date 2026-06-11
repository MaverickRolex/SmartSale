class User < ApplicationRecord
  devise :database_authenticatable, :rememberable

  enum :role, { admin: 0, employee: 1 }

  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true
  validates :password, length: { minimum: 4 }, format: { with: /\A\d+\z/, message: "must contain only numbers" }, if: :password_validation_required?

  before_validation :normalize_user_name

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def normalize_user_name
    self.user_name = user_name.to_s.strip.downcase
  end

  def password_validation_required?
    password.present? || encrypted_password.blank?
  end
end
