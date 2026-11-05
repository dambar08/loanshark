class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :loans, class_name: "Loan", inverse_of: :user
  has_many :accounts, class_name: "Account", inverse_of: :user
  has_many :name_screenings, dependent: :destroy
end
