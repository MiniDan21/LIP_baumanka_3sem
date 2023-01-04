require 'rails_helper.rb'

RSpec.describe 'Static content', type: :system do
  let(:email) { 'example@gmail.com' }
  let(:password) { 'password' }
  let(:input) { 50 }

  scenario 'Sign up, login in, calculate' do
    visit '/users/new'
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
    find(".btn").click
    expect(current_path).to eq('/users/new')

    visit '/log/sign_in'
    fill_in :email, with: email
    fill_in :password, with: password
    find(".btn").click
    expect(current_path).to eq("/log/sign_in")

    visit root_path
    fill_in :query, with: input
    find(".btn").click
    expect(find('table')).to have_text("Автоморфные числа\nЧисло Квадрат числа\n1 1\n5 25\n6 36\n25 625")
  end
end
