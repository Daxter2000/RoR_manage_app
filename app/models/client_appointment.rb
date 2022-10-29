class ClientAppointment < ApplicationRecord
    belongs_to :client
    has_many :client_appointment_products
    has_many :products, through: :client_appointment_products
end
