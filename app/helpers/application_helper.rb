module ApplicationHelper
    def is_admin?
        if user_signed_in? && current_user.role.role_name == 'Administrador'

          @admin = true
          @super = false
          @emple =false
        end
      end
      def is_super?
        if user_signed_in? && current_user.role.role_name == 'Supervisor'

          @admin = false
          @super = true
          @emple =false
        end
      end
      def is_emple?
        if user_signed_in? && current_user.role.role_name == 'Empleado'

          @admin = false
          @super = false
          @emple = true
        end
      end

      def validate_rut 
      end
end
