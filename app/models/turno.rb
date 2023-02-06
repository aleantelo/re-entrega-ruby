class Turno < ApplicationRecord
    belongs_to :sucursal, class_name: "Sucursal"
    belongs_to :cliente, class_name: "User"
    belongs_to :personal, class_name: "User", optional:true
    validates :fecha, :hora, :motivo , presence: { message: "Por favor complete este campo" }
    validates :comentario, presence: false
end
