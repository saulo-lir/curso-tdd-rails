 require 'rails_helper'

RSpec.describe "Customers", type: :request do
  
  it 'returns a 200 response' do
    get customers_path
    expect(response).to have_http_status(:ok)
  end

  it 'returns JSON 200 response' do
    get '/customers.json'
    expect(response.body).to include_json([
      id:1,
      name:'teste',
      email:'teste@teste.com'
    ])
  end

  it 'returns a 302 response' do
    customer = create(:customer)
    get :show, params: { id: customer.id }
    expect(response).to have_http_status(302)
  end

  it '#show' do
    member = create(:member)
    customer = create(:customer)

    sign_in member

    get :show, params: { id: customer.id }
    expect(response).to have_http_status(200)
  end

  it '#create' do
    member = create(:member)
    customer_params = attributes_for(:customer)
    sign_in member
    expect{
      post :create, params: { customer: customer_params }
    }.to change(Customer, :count).by(1)
  end
end
