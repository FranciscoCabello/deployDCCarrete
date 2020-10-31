class Servicio < ApplicationRecord

    validates :nombre, presence:true
    belongs_to :user
    has_and_belongs_to_many :carretes
    has_many :comentarioservicios
    has_and_belongs_to_many :comunas
end
