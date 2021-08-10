# Matchers são os operadores que definem qual expectativa esperamos para o teste.
# São usados em conjunto com expect(..).to ou expect(..).not_to.
# Ex.: expect(result).to eq(12) , Aqui o matcher utilizado foi o de igualdade 'eq()'

describe 'Matchers de Comparação' do
  it 'equal - Testa se é o mesmo objeto' do
    x = "ruby"
    y = "ruby"

    expect(x).to equal(y) # Irá falhar
    expect(x).not_to equal(y) # Irá passar
    expect(x).to equal(x) # Irá passar
  end

  it 'be - Testa se é o mesmo objeto. É a mesma coisa que o equal' do
    x = "ruby"
    y = "ruby"

    expect(x).not_to be(y) # Irá passar
    expect(x).to be(x) # Irá passar
  end

  it 'eql - Testa se é o mesmo valor/conteúdo' do
    x = "ruby"
    y = "ruby"

    expect(x).to eql(y) # Irá passar
  end

  it 'eq - Testa se é o mesmo valor/conteúdo. É a mesma coisa que o eql' do
    x = "ruby"
    y = "ruby"

    expect(x).to eq(y) # Irá passar
  end
end

describe 'Matchers Verdadeiro / Falso' do
  it 'be true' do
    expect(1.odd?).to be true # Irá passar
  end

  it 'be_truthy - Mesma coisa que be true' do
    expect(1.odd?).to be_truthy true # Irá passar
  end

  it 'be false' do
    expect(1.even?).to be false # Irá passar
  end

  it 'be_falsey - Mesma coisa que be false' do
    expect(1.even?).to be_falsey # Irá passar
  end

  it 'be_nil' do
    expect(defined? x).to be_nil # Irá passar
  end
end

describe 'Matchers de Igualdade' do
  it '>' do
    expect(5).to be > 1 # Irá passar
  end

  it '>=' do
    expect(5).to be >= 2 # Não irá passar
    expect(5).to be >= 5 # Irá passar
  end

  it '<' do
    expect(5).to be < 10 # Irá passar
  end

  it '<=' do
    expect(5).to be <= 2 # Não irá passar
    expect(5).to be <= 5 # Irá passar
  end

  it 'be_between inclusive' do
    expect(5).to be_between(2, 7).inclusive # Irá passar. O inclusive irá considerar o 2 e 7
    expect(2).to be_between(2, 7).inclusive # Irá passar
    expect(7).to be_between(2, 7).inclusive # Irá passar
  end

  it 'be_between exclusive' do
    expect(5).to be_between(2, 7).exclusive # Irá passar. O exclusive não irá considerar o 2 e 7
    expect(2).to be_between(2, 7).exclusive # Não irá passar
    expect(7).to be_between(2, 7).exclusive # Não irá passar
  end

  it 'match - Expressãoregular' do
    expect("fulano@com.br").to match(/..@../) # Irá passar
  end

  it 'start_with' do
    expect("fulano de tal").to start_with("fulano") # Irá passar
    expect([1,2,3]).to start_with(1) # Irá passar
  end

  it 'end_with' do
    expect("fulano de tal").to end_with("tal") # Irá passar
    expect([1,2,3]).to start_end(3) # Irá passar
  end
end

describe 'Matchers de Classes' do
  it 'be_instance_of - Exatamente a classe' do
    expect(10).to be_instance_of(Integer) # Irá passar
  end

  it 'be_kind_of - Pode ser por herança' do
    expect(10).to be_kind_of(Integer) # Irá passar
  end
end

describe 'Matchers de Atributos de Classes' do
  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = "Gandalf"
    expect(pessoa).to have_attributes(nome: "Gandalf") # Irá passar
  end
end

describe Array.new([1,2,3]), 'Matchers de Arrays' do
  it 'include' do
    expect(subject).to include(2) # Irá passar
  end
end

describe 'Composição de expectativas' do
  it 'and' do
    expect(subject).to start_with("Com").and end_with("vas") # Irá passar
  end

  it 'or' do
    expect(fruta).to eq('banana').or eq('laranja').or eq('uva') # Irá passar
  end

  # helper method arbitrário
  def fruta
    %w(banana laranja uva).sample
  end
end

describe 'Aplicando Hooks before, after e around' do

  before(:each) do
    puts ">>> ANTES DE CADA TESTE"
  end

  after(:each) do
    puts ">>> DEPOIS DE CADA TESTE"
  end

  # O around aplica o before e o after ao mesmo tempo
  around(:each) do |teste|
    puts ">>> ANTES DE CADA TESTE"
    teste.run # Faz o teste
    puts ">>> DEPOIS DE CADA TESTE"
  end

  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = "Gandalf"
    expect(pessoa).to have_attributes(nome: "Gandalf") # Irá passar
  end
end

# Agregando falhas
it 'Agregando Falhas' do
  aggregate_failures do
    expect(5).to be_between(2, 7).exclusive # Irá passar. O exclusive não irá considerar o 2 e 7
    expect(2).to be_between(2, 7).exclusive # Não irá passar
    expect(7).to be_between(2, 7).exclusive # Não irá passar
  end
end

# Ou

it 'Agregando Falhas', :aggregate_failures do # Ou aggregate_failures: true
  expect(5).to be_between(2, 7).exclusive # Irá passar. O exclusive não irá considerar o 2 e 7
  expect(2).to be_between(2, 7).exclusive # Não irá passar
  expect(7).to be_between(2, 7).exclusive # Não irá passar
end