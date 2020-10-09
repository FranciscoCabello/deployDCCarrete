json.extract! servicio, :id, :nombre, :descripcion, :capacidad, :costo, :valoracion, :imagen, :categoria, :user, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)
