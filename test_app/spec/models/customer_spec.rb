require 'rails_helper'

RSpec.describe Customer, type: :model do

  # Trabalhando com Fixtures. Usando o arquivo fixtures/customers.yml
  #fixtures :customers

  it 'Criando um Customer' do
    #customer = customers(:gandalf)

    # Criando o customer definido na factory
    customer = create(:customer) # A diferença do create para o build() é que este só instancia a classe, mas não faz o save.
    expect(customer.name).to eq('Gandalf')
  end

  it 'Sobrescrevendo Atributos da Factory' do
    customer = create(:customer, vip: false, days_to_pay: 10)
    expect(customer.vip).to eq(false)
  end

  it 'Sobrescrevendo Atributos da Factory com Herança' do
    customer = create(:customer_vip) # Ou customer_default
    expect(customer.vip).to eq(true)
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer) # O attributes_for extrai os atributos da factory e retorna um hash
    attrs2 = attributes_for(:customer_vip)
    puts attrs
    puts attrs2
  end

  # it 'Usando Traits' do
  #   customer = create(:customer_vip, :male)
  #   expect(customer.gender).to eq('M')
  # end
=begin
  it 'Transient Attributes' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
=end
end
