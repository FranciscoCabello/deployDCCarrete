require 'rails_helper'

RSpec.describe "comentarioservicios/edit", type: :view do
  before(:each) do
    @comentarioservicio = assign(:comentarioservicio, Comentarioservicio.create!(
      :user => 1,
      :comentario => "MyText",
      :servicio => 1
    ))
  end

  it "renders the edit comentarioservicio form" do
    render

    assert_select "form[action=?][method=?]", comentarioservicio_path(@comentarioservicio), "post" do

      assert_select "input[name=?]", "comentarioservicio[user]"

      assert_select "textarea[name=?]", "comentarioservicio[comentario]"

      assert_select "input[name=?]", "comentarioservicio[servicio]"
    end
  end
end
