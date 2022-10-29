class Users::InvitationsController < Devise::InvitationsController
    
	def update
		super do |user|
			p "ALFREDO INVITATION CONTROLLER"
			p user.id
			UserCompany.transaction do
				begin 
					user_company = UserCompany.where(:user_id => user.invited_by_id).first
					p "USer company"
					p user_company
					account = UserCompany.create(user_id: user.id, :company_id => user_company.company_id)
					p "cuenta a guardar"
					p account
					account.save!
				rescue ActiveRecord::RecordInvalid
          flash[:error] = "Unable to add friend."
          redirect_back fallback_location: root_path
          raise ActiveRecord::Rollback
        end 

			end   				
		end
	end
end