class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cargar_registros
  def cargar_registros
    @categorias = Category.all
  end
  def authenticate_editor!
    redirect_to root_path, alert: "No Tienes Permisos Para Ingresar Aqui." unless user_signed_in? && current_user.is_editor?
  end
  def authenticate_admin!
    redirect_to root_path, alert: "No Tienes Suficientes Permisos Para Ingresar Aqui." unless user_signed_in? && current_user.is_admin?
  end
end
