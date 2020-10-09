
servicios = ServiciosController.create([
  {
    email: "user1@gmail.com",
    encrypted_password: "Hola",
    nombre: "Juana Gonzalez",
    edad: 23,
    imagen: "url",
    telefono: "+569XXXXXXX",
    reset_password_token: "reset",
    reset_password_sent_at:"",
    remember_created_at: ""
  },
  {
    email: "administrador@gmail.com",
    encrypted_password: "Hola",
    nombre: "Samuel Bendito",
    edad: 36,
    imagen: "url",
    telefono: "+569XXXXXXX",
    reset_password_token: "reset",
    reset_password_sent_at:"",
    remember_created_at: ""
  },
  {
    email: "user2@gmail.com",
    encrypted_password: "Hola",
    nombre: "Antonio Perez",
    edad: 66,
    imagen: "url",
    telefono: "+569XXXXXXX",
    reset_password_token: "reset",
    reset_password_sent_at:"",
    remember_created_at: ""
  }
  ])

  creadorcarretes = CreateCarretes.create([
    {
      titulo: "Partyhouse",
      descripcion: "Mejor carrete de fin de semestre",
      direccion: "Bustos 2020, Providencia",
      capacidad: 50,
      costo: 5000,
      estado: 0,
      imagen: "imagen_url",
      user: 4
    },
    {
      titulo: "Halloween",
      descripcion: "Tinieblas de Lucifer",
      direccion: "Infierno 666, La Reina",
      capacidad: 150,
      costo: 10000,
      estado: 1,
      imagen: "imagen_url",
      user: 6
    },
    {
      titulo: "Troleamos",
      descripcion: "Spam, sino para que",
      direccion: "Alameda 4039, Santiago",
      capacidad: 20,
      costo: 3000,
      estado: 2,
      imagen: "imagen_url",
      user: 8
    }
    ])

    creadorservicios = CreateServcios.create([
      {
        titulo: "Luces estrafalarias",
        descripcion: "La iluminacion lo es todo, haz el mejor ambiente",
        capacidad: 150,
        costo: 30000,
        valoracion: 4.5,
        imagen: "imagen_url",
        categoria: "normal",
        user: 8
      },
      {
        titulo: "Bartender",
        descripcion: "Ofrecemos los mejores bartenders a nivel internacional",
        capacidad: 50,
        costo: 50000,
        valoracion: 4.8,
        imagen: "imagen_url",
        categoria: "premium",
        user: 8
      },
      {
        titulo: "Fuegos artificiales",
        descripcion: "Para  grandes celebraciones y fuertes emociones",
        capacidad: 200,
        costo: 100000,
        valoracion: 4.95,
        imagen: "imagen_url",
        categoria: "premium",
        user: 8
      }
      ])
