module ApplicationHelper
    def user_role?
        if user_signed_in? && current_user.role.role_name == 'Administrador'
          @admin = true
          @super = false
          @emple =false
        elsif user_signed_in? && current_user.role.role_name == 'Supervisor'
          @admin = false
          @super = true
          @emple =false
        elsif user_signed_in? && current_user.role.role_name == 'Empleado'
          @admin = false
          @super = false
          @emple = true
        end
      end
end
