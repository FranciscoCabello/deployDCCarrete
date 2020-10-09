class Carrete < ApplicationRecord

    validates :titulo, presence:true

    has_and_belongs_to_many :users
    has_and_belongs_to_many :servicios
    has_many :comentariocarretes
end
