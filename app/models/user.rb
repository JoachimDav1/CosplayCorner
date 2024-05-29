class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :costumes, dependent: :destroy

  validates :email, format: { with: Devise.email_regexp }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/ }
end
