require 'rails_helper'

RSpec.describe Servicio, type: :model do
    it "should create correctly" do
        servicio = Servicio.new(:nombre => 'servicio fino', :descripcion => 'Va a estar weno', :capacidad => 4, :costo => 1000, :valoracion => 0, :imagen => 'https://s1.eestatic.com/2019/08/05/como/Verano-Invierno-Fiestas-Decoracion-Trucos-Celebraciones-Cumpleanos-Como_hacer_419219515_131676255_1706x960.jpg', :categoria => 'luces', :user => User.new)
        expect(servicio).to be_valid
    end
end