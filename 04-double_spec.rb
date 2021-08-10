# Classes dublês
# Um objeto falso é um objeto mockado (mock object)
# Outros tipos de objetos falsos são: stub, spy, fake object e dummy object. O RSpec implementa diretamente três deles, o stub, o mock e o spy.

describe 'Test Double' do
  it '--' do
    user = double('User') # Criando um objeto dublê (objeto falso) a partir da classe User
    allow(user).to receive_messages(name: 'Gandalf', password: 'secret') # Concedendo permissão para que se possa usar os atributos nome e password da classe
    user.name
    user.password
  end
end