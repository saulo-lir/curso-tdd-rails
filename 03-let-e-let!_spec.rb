=begin
  let e let! (helpers)
  Quando você tiver que atribuir uma variável, ao invés de usar um bloco before para criar uma variável de instância, use let. Ao usar let,
  a variável é carregada apenas quando for usada pela primeira 
  vez no teste e fica no cache até o teste em questão terminar.

  O let! força a invocação do método/helper antes de cada teste.
=end

describe 'let' do
  # Ao invés de:
  before(:each) do
    @pessoa = Pessoa.new
  end

  # Usar:
  let(:pessoa) { Pessoa.new } # Aqui estamos criando uma função de nome pessoa, a qual retorna uma nova instânia da classe Pessoa. Ela é utilizada apenas uma vez em cada teste (em cada bloco de it).

  it 'have_attributes' do
    pessoa.nome = "Gandalf"
    expect(pessoa).to have_attributes(nome: "Gandalf") # Irá passar
  end
end

# Mais um exemplo de let

$counter = 0 # variável global

describe 'let' do
  
  let(:count) { $counter += 1 }

  it 'memoriza o valor' do
    expect(count).to eq(1) # 1ª vez. Vai passar.
    expect(count).to eq(1) # 2ª vez. Usa o valor em cache, ou seja, não executa novamente, então o valor ainda será 1. Vai passar.
  end

  it 'Não é cacheado entre os testes' do
    expect(count).to eq(2) # Como a variável é global e já tinha o valor 1 do teste anterior, então o valor agora será 2. Vai passar.
  end
end

# Exemplo com let!

$counter = 0

describe 'let!' do
  ordem_de_invocacao = []
  
  # Será chamado antes do bloco it ser executado
  let!(:contador) do
    ordem_de_invocacao << :teste
    $counter += 1
  end

  it 'chama o método helper antes do teste' do
    ordem_de_invocacao << :exemplo
    expect(ordem_de_invocacao).to eq([:teste, :exemplo]) # Vai passar
    expect(contador).to eq(1) # Vai passar
  end
end