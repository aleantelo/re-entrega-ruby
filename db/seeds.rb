# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(
    [
        {
            email: "admin@mail.com", 
            password: "123456",
            rol: "Admin"
        },
        {
            email: "personal_loma@mail.com",
            password: "123456",
            rol: "Personal Bancario",
            sucursal_id: 1
        },
        {
            email: "personal_hornos@mail.com",
            password: "123456",
            rol: "Personal Bancario",
            sucursal_id: 2
        },
        {
            email: "personal_matanza@mail.com",
            password: "123456",
            rol: "Personal Bancario",
            sucursal_id: 3
        },
        {
            email: "personal_sinturnos@mail.com",
            password: "123456",
            rol: "Personal Bancario",
            sucursal_id: 4
        },
        {
            email: "cliente@mail.com", 
            password: "123456", 
            rol: "Cliente"
        },
        {
            email: "cliente1@mail.com", 
            password: "123456", 
            rol: "Cliente"
        },
        {
            email: "user_sin_turno@mail.com", 
            password: "123456", 
            rol: "Cliente"
        }
    ]
)

Sucursal.create(
    [
        {
            nombre: "La Loma", 
            direccion: "46 nro 1234", 
            telefono: "221445789"
        },
        {
            nombre: "Los Hornos", 
            direccion: "137 nro 1234", 
            telefono: "2212344789"
        },
        {
            nombre: "La Matanza", 
            direccion: "503 nro 1234", 
            telefono: "22134564"
        },
        {
            nombre: "Sin turnos", 
            direccion: "10 nro 56", 
            telefono: "2215489975"
        }
    ]
)   

Horario.create(
    [
        {
            dia: "Lunes",
            hora_inicio: "08:00",
            hora_fin: "14:00",
            sucursal_id: 1
        },
        {
            dia: "Martes",
            hora_inicio: "10:00",
            hora_fin: "16:00",
            sucursal_id: 1
        },
        {
            dia: "Miercoles",
            hora_inicio: "10:00",
            hora_fin: "16:00",
            sucursal_id: 1
        },
        {
            dia: "Jueves",
            hora_inicio: "08:00",
            hora_fin: "14:00",
            sucursal_id: 1
        },
        {
            dia: "Viernes",
            hora_inicio: "09:00",
            hora_fin: "15:00",
            sucursal_id: 1
        },
        {
            dia: "Lunes",
            hora_inicio: "09:00",
            hora_fin: "15:00",
            sucursal_id: 2
        },
        {
            dia: "Martes",
            hora_inicio: "11:00",
            hora_fin: "17:00",
            sucursal_id: 2
        },
        {
            dia: "Miercoles",
            hora_inicio: "10:00",
            hora_fin: "16:00",
            sucursal_id: 2
        },
        {
            dia: "Jueves",
            hora_inicio: "08:00",
            hora_fin: "14:00",
            sucursal_id: 2
        },
        {
            dia: "Viernes",
            hora_inicio: "09:00",
            hora_fin: "15:00",
            sucursal_id: 2
        },
        {
            dia: "Lunes",
            hora_inicio: "08:00",
            hora_fin: "14:00",
            sucursal_id: 3
        },
        {
            dia: "Martes",
            hora_inicio: "10:00",
            hora_fin: "16:00",
            sucursal_id: 3
        },
        {
            dia: "Miercoles",
            hora_inicio: "09:00",
            hora_fin: "16:00",
            sucursal_id: 3
        },
        {
            dia: "Jueves",
            hora_inicio: "07:00",
            hora_fin: "14:00",
            sucursal_id: 3
        },
        {
            dia: "Viernes",
            hora_inicio: "09:00",
            hora_fin: "15:00",
            sucursal_id: 3
        },{
            dia: "Lunes",
            hora_inicio: "06:00",
            hora_fin: "14:00",
            sucursal_id: 4
        },
        {
            dia: "Martes",
            hora_inicio: "10:00",
            hora_fin: "16:00",
            sucursal_id: 4
        },
        {
            dia: "Miercoles",
            hora_inicio: "11:00",
            hora_fin: "16:00",
            sucursal_id: 4
        },
        {
            dia: "Jueves",
            hora_inicio: "08:00",
            hora_fin: "15:00",
            sucursal_id: 4
        },
        {
            dia: "Viernes",
            hora_inicio: "09:00",
            hora_fin: "16:00",
            sucursal_id: 4
        }
    ]
)

Turno.create(
    [
     {
        fecha: "21-02-2023",
        hora: "11:00",
        motivo: "Prestamos",
        estado: "Pendiente",
        sucursal_id: 1,
        cliente_id: 6
     },
     {
        fecha: "24-02-2023",
        hora: "10:00",
        motivo: "Caja",
        estado: "Pendiente",
        sucursal_id: 2,
        cliente_id: 7
     },
     {
        fecha: "21-02-2023",
        hora: "12:00",
        motivo: "Plazo fijo",
        estado: "Pendiente",
        sucursal_id: 1,
        cliente_id: 7
     },
     {
        fecha: "24-02-2023",
        hora: "12:00",
        motivo: "Plazo fijo",
        estado: "Pendiente",
        sucursal_id: 2,
        cliente_id: 6
     },
     {
        fecha: "16-02-2023",
        hora: "12:00",
        motivo: "Plazo fijo",
        estado: "Pendiente",
        sucursal_id: 3,
        cliente_id: 6
     },
     {
        fecha: "17-02-2023",
        hora: "11:00",
        motivo: "Plazo fijo",
        estado: "Pendiente",
        sucursal_id: 3,
        cliente_id: 6
     },
     {
        fecha: "09-02-2023",
        hora: "14:00",
        motivo: "Plazo fijo",
        estado: "Pendiente",
        sucursal_id: 3,
        cliente_id: 7
     },
     {
        fecha: "21-02-2023",
        hora: "11:00",
        motivo: "Prestamos",
        estado: "Atendido",
        comentario: "Se registro el prestamo con un monto de $1.000.000",
        sucursal_id: 1,
        cliente_id: 6
     },
     {
        fecha: "24-02-2023",
        hora: "10:00",
        motivo: "Caja",
        estado: "Atendido",
        comentario: "El cliente retiro $500.000 de su caja",
        sucursal_id: 2,
        cliente_id: 7
     },
    ]
)
