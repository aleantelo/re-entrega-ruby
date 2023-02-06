class UsuariosController < ApplicationController
    load_and_authorize_resource class: 'User'

    def index
        @users = User.all.order(rol: :desc)
    end

    def show
        @admin = params[:admin]
        user
    end

    def new_personal
        @user = User.new
        @user.rol="Personal Bancario"
        @sucursals = Sucursal.all
    end

    def new_admin
        @user = User.new
        @user.rol="Admin"
    end

    def create_admin
            @user = User.create({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :rol => params[:rol]})
            if @user.save 
                redirect_to usuarios_path, notice: t(".create")
            else
                render :new_admin, status: :unprocessable_entity
            end
    end

    def create_personal
        @user = User.create({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :rol => params[:rol], :sucursal_id => params[:sucursal_id]})
        if @user.save 
            redirect_to usuarios_path, notice: t(".create")
        else
            p @admin
            render :new_personal, status: :unprocessable_entity
        end
end

    def edit
        @admin = @admin = params[:admin]
        @usuario = User.find(params[:id])
    end

    def update
        if user.update(user_params)
            redirect_to usuarios_path, notice: t(".updated")
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        begin
            user.destroy
            redirect_to '/usuarios', notice: t(".destroyed") 
        rescue
            redirect_to '/usuarios', alert: "No se puede eliminar porque el cliente tiene turnos asignados" 
        end
    end

    private
    def user
        @usuario = User.find(params[:id])
    end
    
    def user_params
        params.permit(:password, :email, :id, :sucursal_id)
    end
end