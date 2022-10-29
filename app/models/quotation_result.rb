class QuotationResult < ApplicationRecord
    belongs_to :client_appointment_product
    belongs_to :general_status
end
