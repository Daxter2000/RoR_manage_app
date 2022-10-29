class ClientAppointmentProduct < ApplicationRecord
    belongs_to :client_appointment
    belongs_to :product
    has_many :quotation_results
end
