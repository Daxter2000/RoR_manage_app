class Client < ApplicationRecord
    belongs_to :company
    has_many :client_appointments
    has_many :client_appointment_products, through: :client_appointments

    validates :names, :ap_pat, :tel, presence: true
    validates :tel, presence: true, numericality: { only_integer: true }
end
