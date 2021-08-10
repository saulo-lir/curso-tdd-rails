require 'rails_helper'

RSpec.describe Order, type: :model do
  it "Tem 1 pedido" do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it "Tem 3 pedidos" do
    orders = create_list(:order, 3, description: 'Teste') # Criando 3 elementos de uma vez
    puts orders.inspect
    expect(orders.count).to eq(3)
  end
end
