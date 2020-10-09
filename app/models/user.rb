class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nombre, presence:true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_and_belongs_to_many :carretescreado
  has_and_belongs_to_many :carretes
  has_many :servicios
  has_many :comentariocarretes
  has_many :comentarioservicios
end
