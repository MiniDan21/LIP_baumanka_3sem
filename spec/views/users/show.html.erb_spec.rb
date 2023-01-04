require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      email: "example@gmail.com",
      password: "password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/example@gmail.com/)
    expect(rendered).to match(/Password digest/)
  end
end
