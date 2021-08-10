require 'rails_helper'

describe Api::V1::FilmsController, type: :controller do
  # it 'is working' do
  #   expect(true).to be true # Espera que true == true
  # end

  describe 'GET /api/v1/films' do # O que se espera testar: A rota de listagem de filmes.

    before do # Cria os filmes e acessa a rota index antes do início dos testes.
      create_films
      get :index, params: { user_token: user_token }
    end
    
    # Setup de inicialização do teste. Cria 2 filmes assim que o teste inicia.
    let(:create_films) do
      Film.create!(name: 'Star Wars', ticket_price: 25.0)
      Film.create!(name: 'Spider Man', ticket_price: 20.0)
    end

    context 'when given a guest user' do
      let(:user_token) {}

      it 'return a list of films with prices with 0% of discount' do
        expect(response.status).to be == 200

        json_body = JSON.parse response.body
        expected_films = [
          {
            'name' => 'Star Wars',
            'ticket_price' => 25.0,
            'discount' => 0
          },
          {
            'name' => 'Spider Man',
            'ticket_price' => 20.0,
            'discount' => 0
          }
        ]

        expect(json_body).to match_array expected_films
      end
    end

    context 'when given a registered user' do
      let(:user_token) do
        token = 'registered-token'
        User.create!(token: token, is_premium: false)
        token
      end

      it 'return a list of films with prices with 5% of discount' do
        expect(response.status).to be == 200

        json_body = JSON.parse response.body
        expected_films = [
          {
            'name' => 'Star Wars',
            'ticket_price' => 25.0,
            'discount' => 0
          },
          {
            'name' => 'Spider Man',
            'ticket_price' => 20.0,
            'discount' => 0
          }
        ]

        expect(json_body).to match_array expected_films
      end
    end

    context 'when given a premium user' do
      let(:user_token) do
        token = 'registered-token'
        User.create!(token: token, is_premium: true)
        token
      end

      it 'return a list of films with prices with 15% of discount' do
        expect(response.status).to be == 200

        json_body = JSON.parse response.body
        expected_films = [
          {
            'name' => 'Star Wars',
            'ticket_price' => 25.0,
            'discount' => 0
          },
          {
            'name' => 'Spider Man',
            'ticket_price' => 20.0,
            'discount' => 0
          }
        ]

        expect(json_body).to match_array expected_films
      end
    end
  end
end
