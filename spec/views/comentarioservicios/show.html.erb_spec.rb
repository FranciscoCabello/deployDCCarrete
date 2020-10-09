require 'rails_helper'

RSpec.describe "comentarioservicios/show", type: :view do
  before(:each) do
    @comentarioservicio = assign(:comentarioservicio, Comentarioservicio.create!(
      :user => 2,
      :comentario => "MyText",
      :servicio => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
  end
end
