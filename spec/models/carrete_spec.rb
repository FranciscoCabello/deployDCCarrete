require 'rails_helper'

RSpec.describe Carrete, type: :model do
    it "should create correctly" do
        carrete = Carrete.new(:titulo => 'Carrete fino', :descripcion => 'Va a estar weno', :direccion => 'Las turquezas 123', :capacidad => 4, :costo => 1000, :estado => 0, :imagen => 'https://s1.eestatic.com/2019/08/05/como/Verano-Invierno-Fiestas-Decoracion-Trucos-Celebraciones-Cumpleanos-Como_hacer_419219515_131676255_1706x960.jpg', :user => 1)
        expect(carrete).to be_valid
    end

    context "When invalid input are given to create carrete" do
        it "should not create because no titulo" do
            carrete = Carrete.new(:descripcion => 'Va a estar weno', :direccion => 'Las turquezas 123', :capacidad => 4, :costo => 1000, :estado => 0, :imagen => 'https://s1.eestatic.com/2019/08/05/como/Verano-Invierno-Fiestas-Decoracion-Trucos-Celebraciones-Cumpleanos-Como_hacer_419219515_131676255_1706x960.jpg', :user => 1)
            expect(carrete).not_to be_valid
        end
    end
end