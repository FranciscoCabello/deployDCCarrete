require 'rails_helper'

RSpec.describe Comentariocarrete, type: :model do
  it "should create correctly" do
    comentariocarrete = Comentariocarrete.new(:user => User.new, :comentario => 'hola', :carrete => Carrete.new)
    expect(comentariocarrete).to be_valid
  end
end