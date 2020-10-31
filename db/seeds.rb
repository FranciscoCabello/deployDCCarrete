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
             imagen: 'https://upload.wikimedia.org/wikipedia/commons/6/61/01Jorge_Zabaleta.png',
             telefono: 966261252,
             admin: true,
             password: '123456',
             password_confirmation: '123456')
