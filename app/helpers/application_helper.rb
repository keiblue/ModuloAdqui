module ApplicationHelper
    def user_role?
        if user_signed_in? && current_user.role.id == 1
          session[:admin]= true
          session[:super]= false
          session[:emple]= false
        elsif user_signed_in? && current_user.role.id == 2
          session[:admin]= false
          session[:super]= true
          session[:emple]= false
        elsif user_signed_in? && current_user.role.role_name == 'Empleado'
          session[:admin]= false
          session[:super]= false
          session[:emple]= true
        end
      end
end
