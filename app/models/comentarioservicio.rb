class Comentarioservicio < ApplicationRecord

    validates :user, presence:true
    belongs_to :user
    belongs_to :servicio
end
