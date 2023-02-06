class Horario < ApplicationRecord

    validates :hora_inicio, :hora_fin, presence: { message: "Por favor complete este campo" }

    validates :dia, uniqueness: {scope: :sucursal_id}

    belongs_to :sucursal
    
end