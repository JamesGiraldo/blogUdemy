module PermissionsConcern extend ActiveSupport::Concern
    def is_normal_user?
      self.permission_lavel == 0
    end
    def is_editor?
      self.permission_lavel >= 1
    end
    def is_admin?
      self.permission_lavel >= 2
    end
end
