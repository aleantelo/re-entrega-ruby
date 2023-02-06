class TurnosController < ApplicationController
    load_and_authorize_resource
    
    def index
        if current_user.rol == "Personal Bancario"
            @turnos = Turno.where(sucursal_id: current_user.sucursal_id, estado: "Pendiente")
        else
            @turnos = Turno.where(:cliente_id => current_user.id).order(estado: :desc)

        end
    end

    def new
        sucursal
        @turno = Turno.new
    end
    
    def show 
        @turno = Turno.find(params[:id])
    end

    def create
            if (valite_campos)
                redirect_to new_turno_path(sucursal_id), alert: ( "Por favor complete todos los campos")
            else
                if(validate_fecha)
                    @turno = Turno.new(turno_params)
                        if @turno.save
                            redirect_to turnos_path,  notice: t(".create") 
                        else
                            redirect_to new_turno_path(sucursal_id), alert: ("Ocurrio un error inesperado. Comunniquese con la mesa de ayuda")
                        end
                else
                        redirect_to new_turno_path(sucursal_id), alert: ("El horario seleccionado esta fuera del horario de atencion")
                end
            end
    end

    def edit
        @turno = Turno.find(params[:id])
        @sucursal = Turno.find(params[:id]).sucursal
    end

    def update
        @turno = Turno.find(params[:id])
            begin
            if validate_fecha
                if @turno.update(turno_params)
                    redirect_to turnos_path, notice: t(".edited") 
                else
                    redirect_to edit_turno_path(@turno.id), alert: t(".not_edited") 
                end
            else
                redirect_to edit_turno_path(@turno.id), alert: ("El horario seleccionado esta fuera del horario de atencion")

            end
        rescue
            redirect_to edit_turno_path(@turno.id), alert: ("Por favor complete todos los campos") 
        end
    end
    

    def destroy
        @turno = Turno.find(params[:id])
        @turno.destroy
        redirect_to turnos_path()
    end

    private
    def turno_params
        params.require(:turno).permit(:sucursal_id, :fecha, :hora, :motivo, :estado,:cliente_id)
    end

    def sucursal_id
        params[:turno][:sucursal_id]
    end
    def sucursal
        @sucursal = Sucursal.find(params[:id])
    end

    def validate_fecha
        sucursal = Sucursal.find(params[:turno][:sucursal_id])
        dia_seleccionado = sucursal.horario.filter{|horario| horario.dia==I18n.l(Date.parse(params[:turno][:fecha].to_s),format: '%A')}
        if !dia_seleccionado.empty?
            ((dia_seleccionado[0].hora_inicio.strftime("%H:%M") <= params[:turno][:hora]) && (dia_seleccionado[0].hora_fin.strftime("%H:%M") >= params[:turno][:hora])) 
        else
            return false
        end
    end

    def valite_campos
        (params[:turno][:hora] == "") || (params[:turno][:motivo]=="") || (params[:turno][:fecha] == "")
    end
end