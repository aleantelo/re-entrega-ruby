class HorariosController < ApplicationController
    load_and_authorize_resource 

    def new
        sucursal
        @horario = Horario.new
    end

    def create
        @horario = Horario.new(horario_params)
        @sucursal = Sucursal.find(horario_params[:sucursal_id])
        if @horario.save
            redirect_to sucursal_path(horario_params[:sucursal_id])
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @sucursal = Sucursal.find(params[:id_sucursal])
        horario
    end

    def update
        if horario.update(horario_params)
            redirect_to sucursal_path(horario_params[:sucursal_id]) , notice: "Horario actualizado correctamente"
        else
            redirect_to sucursal_path(horario_params[:sucursal_id]) , alert: "No se pudo actualizar el horario, completar los campos correctamente"
        end
    end

    def destroy
        if horario.destroy
            redirect_to sucursal_path(params[:id_sucursal]) , notice: "Horario eliminado correctamente"
        else
            redirect_to sucursal_path(params[:id_sucursal]) , alert: "No se pudo eliminar el horario"
        end
    end

    private
    def sucursal
        @sucursal = Sucursal.find(params[:id])
    end

    private
    def horario
        @horario = Horario.find(params[:id])
    end

    private
    def horario_params
        {
            :dia => params['horario']['dia'],
            :hora_inicio => params['horario']['hora_inicio'], 
            :hora_fin => params['horario']['hora_fin'],
            :sucursal_id => params[:horario][:sucursal_id]
        }
    end
end