class Comuna < ApplicationRecord
    has_and_belongs_to_many :servicios
    has_many :carretes
end
