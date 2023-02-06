class SucursalsController < ApplicationController
    load_and_authorize_resource 
    def index
        @sucursales = Sucursal.all
    end

    def show
        sucursal
        sucursal.horario.each do |horario|
            p horario
        end
    end

    def new
        @sucursal = Sucursal.new
    end

    def index_turno
        @sucursales = Sucursal.all
    end


    def create
        @sucursal = Sucursal.create(sucursal_params)
        if @sucursal.save
            redirect_to sucursals_path,  notice: t(".create") 
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
       if validate_turno
            sucursal.destroy
            redirect_to sucursals_path, notice: t(".destroyed") 
       else
            redirect_to sucursals_path, alert: t("not_destroyed.") 
       end
    end


    def edit
        @sucursal = Sucursal.find(params[:id])
    end

    def update
        sucursal
        if @sucursal.update(sucursal_params)
            redirect_to sucursals_path, notice: "La sucursal se modifico con éxito"
        else
            render :edit, status: :unprocessable_entity
         end
        
    end

    
    private
    def sucursal
        @sucursal = Sucursal.find(params[:id])
    end
    def sucursal_params
        params.require(:sucursal).permit(:nombre, :direccion, :telefono)
    end

    def validate_turno
        turnos = sucursal.turnos
        if turnos
            turnos.each do |turno|
                if turno.estado == "Pendiente"
                    return false
                end
            end
        else
            return true
        end
    end

end

