# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Comuna.create(nombre: 'Las Condes')
Comuna.create(nombre: 'Vitacura')
Comuna.create(nombre: 'San Joaquín')
Comuna.create(nombre: 'Pedro Aguirre Cerda')
Comuna.create(nombre: 'Lo Espejo')
Comuna.create(nombre: 'San Ramón')
Comuna.create(nombre: 'La Pintana')
Comuna.create(nombre: 'La Cisterna')
Comuna.create(nombre: 'El Bosque')
Comuna.create(nombre: 'La Granja')
Comuna.create(nombre: 'La Florida')
Comuna.create(nombre: 'Peñalolén')
Comuna.create(nombre: 'Ñuñoa')
Comuna.create(nombre: 'Macul')
Comuna.create(nombre: 'La Reina')
Comuna.create(nombre: 'Providencia')
Comuna.create(nombre: 'Lo Barnechea')
Comuna.create(nombre: 'Renca')
Comuna.create(nombre: 'Recoleta')
Comuna.create(nombre: 'Quilicura')
Comuna.create(nombre: 'Independencia')
Comuna.create(nombre: 'Huechuraba')
Comuna.create(nombre: 'Conchalí')
Comuna.create(nombre: 'Santiago')
Comuna.create(nombre: 'San Miguel')
Comuna.create(nombre: 'Cerrillos')
Comuna.create(nombre: 'Estación Central')
Comuna.create(nombre: 'Maipú')
Comuna.create(nombre: 'Cerro Navia')
Comuna.create(nombre: 'Lo Prado')
Comuna.create(nombre: 'Pudahuel')
Comuna.create(nombre: 'Quinta Normal')



User.create(nombre: 'Jorge Zabaleta',
             email: 'zabaleta@gmail.com',
             edad: 35,
             telefono: 966261252,
             admin: true,
             password: '234567',
             password_confirmation: '234567')


User.create(nombre: 'Augusto Schuster',
             email: 'aschuster@gmail.com',
             edad: 28,
             telefono: 985692483,
             admin: false,
             password: '912345',
             password_confirmation: '912345')


User.create(nombre: 'Tonka Tomicic',
             email: 'ttomicic@gmail.com',
             edad: 44,
             telefono: 953942331,
             admin: false,
             password: '123456',
             password_confirmation: '123456')

User.create(nombre: 'Inna Moll',
            email: 'imoll@gmail.com',
            edad: 24,
            telefono: 953942331,
            admin: false,
            password: '123476',
            password_confirmation: '123476')


Carrete.create(titulo: "Partyhouse",
              descripcion: "Mejor carrete de fin de semestre",
              direccion: "Bustos 2020, Providencia",
              capacidad: 50,
              costo: 5000,
              estado: 0,
              user: 2,
              fecha: "2020-11-27 21:15:40",
              comuna_id: 6,
              aprobado: 1)

Carrete.create(titulo: "LOL",
       descripcion: "League of Legends",
       direccion: "Plaza de la dignidad, Santiago",
       capacidad: 100,
       costo: 2000,
       estado: 0,
       user: 3,
       fecha: "2020-11-26 21:15:40",
       comuna_id: 6,
       aprobado: 1)

Carrete.create(titulo: "Halloween",
       descripcion: "Tinieblas de Lucifer",
       direccion: "Infierno 666, La Reina",
       capacidad: 150,
       costo: 10000,
       estado: 1,
       user: 4,
       fecha: "2020-11-29 21:15:40",
       comuna_id: 6,
       aprobado: 1)
     
Carrete.create(titulo: "Troleamos",
       descripcion: "Spam, sino para que",
       direccion: "Alameda 4039, Santiago",
       capacidad: 20,
       costo: 3000,
       estado: 2,
       user: 4,
       fecha: "2020-12-01 21:15:40",
       comuna_id: 6,
       aprobado: 1)



Bet.create(user_id: 2,
          carrete_id: 2,
          bet: 10000)

Bet.create(user_id: 3,
            carrete_id: 3,
            bet: 10000)

Bet.create(user_id: 3,
            carrete_id: 2,
            bet: 7000)

Bet.create(user_id: 4,
            carrete_id: 4,
            bet: 9000)

Bet.create(user_id: 4,
            carrete_id: 3,
            bet: 12000)

Comentariocarrete.create(user: 2,
          comentario: "Muy Bueno",
          carrete: 3,
          user_id: 2,
          carrete_id: 3)

Servicio.create(nombre: "Luce",
            descripcion: "1La iluminacion lo es todo, haz el mejor ambiente",
            capacidad: 150,
            costo: 30000,
            valoracion: 4,
            categoria: "",
            user: 2,
            user_id: 2,
            aprobado: 1)

Servicio.create(nombre: "Luces",
              descripcion: "La iluminacion lo es todo, haz el mejor ambiente",
              capacidad: 150,
              costo: 30000,
              valoracion: 4.5,
              categoria: "VIP",
              user: 3,
              user_id: 3,
              aprobado: 1)


Servicio.create(nombre: "Bartender",
                descripcion: "Ofrecemos los mejores bartenders a nivel internacional",
                capacidad: 50,
                costo: 50000,
                valoracion: 4.8,
                categoria: "",
                user: 2,
                user_id: 2,
                aprobado: 1)


Servicio.create(nombre: "Fuegos artificiales",
              descripcion: "Para grandes celebraciones y fuertes emociones",
              capacidad: 200,
              costo: 100000,
              valoracion: 4.95,
              categoria: "",
              user: 2,
              user_id: 2,
              aprobado: 1)
