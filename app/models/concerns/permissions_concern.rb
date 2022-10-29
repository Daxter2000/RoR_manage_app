module PermissionsConcern 
    extend ActiveSupport::Concern
    
    def is_normal_user?
        self.user_permissions >= 1
    end

    def is_editor?
        self.user_permissions >= 2
    end

    def is_admin?
        self.user_permissions >= 3
    end

    def has_company?
        !self.user_company.nil?
    end

    def duplicate_company?
        self.user_company.nil?
    end
end