class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :user_company
  has_one :company, through: :user_companies

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

include PermissionsConcern
end
