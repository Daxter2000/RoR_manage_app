class Company < ApplicationRecord
    has_many :user_companies
    has_many :users, through:  :user_companies
    has_many :clients 
    
    validates :name, :adress, presence: true
    validates :RFC, length: {maximum: 13, too_long: "El maximo numero de caracteres para el RFC es de 13"}


end
