require 'rails_helper'

RSpec.describe "comentarioservicios/new", type: :view do
  before(:each) do
    assign(:comentarioservicio, Comentarioservicio.new(
      :user => 1,
      :comentario => "MyText",
      :servicio => 1
    ))
  end

  it "renders new comentarioservicio form" do
    render

    assert_select "form[action=?][method=?]", comentarioservicios_path, "post" do

      assert_select "input[name=?]", "comentarioservicio[user]"

      assert_select "textarea[name=?]", "comentarioservicio[comentario]"

      assert_select "input[name=?]", "comentarioservicio[servicio]"
    end
  end
end
