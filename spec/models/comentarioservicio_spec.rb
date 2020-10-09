require 'rails_helper'

RSpec.describe Comentarioservicio, type: :model do
  it "should create correctly" do
    comentarioservicio = Comentarioservicio.new(:user => User.new, :comentario => 'hola', :servicio => Servicio.new)
    expect(comentarioservicio).to be_valid
  end
end
