class UserCompany < ApplicationRecord
    belongs_to :company
    belongs_to :user

    validates :company_id, :user_id, presence: true 

end
