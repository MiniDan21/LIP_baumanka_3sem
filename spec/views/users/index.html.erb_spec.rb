require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "example1@gmail.com",
        password: "password"
      ),
      User.create!(
        email: "example2@gmail.com",
        password: "password"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("example1".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("example2".to_s), count: 1
  end
end
