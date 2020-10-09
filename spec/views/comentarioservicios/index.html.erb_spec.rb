require 'rails_helper'

RSpec.describe "comentarioservicios/index", type: :view do
  before(:each) do
    assign(:comentarioservicios, [
      Comentarioservicio.create!(
        :user => 2,
        :comentario => "MyText",
        :servicio => 3
      ),
      Comentarioservicio.create!(
        :user => 2,
        :comentario => "MyText",
        :servicio => 3
      )
    ])
  end

  it "renders a list of comentarioservicios" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
