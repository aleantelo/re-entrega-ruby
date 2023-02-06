class ComentariosController < ApplicationController

    def new 
        turno
    end

    def show
        @comentario = turno.comentario
    end

    def create
        if params[:comentario].empty?
            redirect_to turnos_path, alert: t(".not_commented") 
        else
            if turno.update(turno_params)
                redirect_to turnos_path, notice: t(".commented") 
            else
                redirect_to turnos_path, alert: t(".not_commented") 
            end
        end
    end


    private 
    def turno_params
        {
            :comentario => params[:comentario],
            :bancario_id => current_user.id,
            :estado => "Atendido"
        }
    end

    def turno
        @turno = Turno.find(params[:id])

    end

end