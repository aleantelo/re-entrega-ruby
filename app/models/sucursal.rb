class Sucursal < ApplicationRecord
    validates :nombre, uniqueness: { case_sensitive: false }

    validates :nombre, :direccion, :telefono , presence: { message: "Por favor complete este campo" }
    
    has_many :horario, dependent: :destroy
    has_many :turnos, dependent: :destroy
    has_many :usuarios

end