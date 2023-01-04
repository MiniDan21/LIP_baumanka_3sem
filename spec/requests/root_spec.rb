require 'rails_helper'

RSpec.describe "Roots", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get root_show_path, params: { query: 350 }
      expect(response).to have_http_status(:success)
    end

    context 'returns http code 302' do
      it "empty parameter" do
        get root_show_path, params: {}
        expect(response).to have_http_status(302)
      end

      it "Bad input" do
        get root_show_path, params: { query: 'qwerty' }
        expect(response).to have_http_status(302)
      end
    end

    context 'controller tests' do
      it 'test @arr' do
        get root_show_path, params: { query: 350 }
        expect(assigns(:arr)).to eq([1, 5, 6, 25, 76])
      end

      it 'test @number' do
        get root_show_path, params: { query: 350 }
        expect(assigns(:number)).to eq(350)
      end
    end

    context 'redirect to input' do
      it 'redirect with bad input' do
        get root_show_path, params: { query: 'qwerty' }
        expect(response).to redirect_to(root_path)
      end

      it 'redirect with empty input' do
        get root_show_path, params: {}
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
