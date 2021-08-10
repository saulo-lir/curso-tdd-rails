require 'rails_helper'

RSpec.describe Product, type: :model do
=begin 
  Testes default serem feitos com Models:
    1- Quando instanciado com atributos válidos, o model deve ser válido;
    2- Validações devem ser testadas;
    3- Métodos de classe e instância devem executar corretamente.
=end

  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validates' do
    it 'is invalid without description' do
      product = build(:product, description: nil) # Se fosse o create, o teste nem passaria dessa linha, pois o model não iria permitr fazer o save
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end
  
    # O mesmo teste acima, porém com a gem shoulda-matchers
    it { should validate_presence_of(:description) }
    # Ou it { is_expected.to validate_presence_of(:description) }
  
    it 'is invalid without price' do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
  
    it 'is invalid without category' do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end
  end

  context 'Associtations' do
    # Valida relacionamento (usando a gem shoulda-matchers)
    it { should belong_to(:category) }
  end

  context 'Instance Methods' do
    it 'return a product with a full description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end

end
