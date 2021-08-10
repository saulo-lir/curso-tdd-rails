=begin
  Fases de um teste no padrão xUnit:
    Setup
    Exercise
    Verify
    Teardown

  Os Mocks são para a fase de Verify. São usados para testar comportamentos.

  Ex.: 

  expect(student).to receive(:bar)
=end

describe 'Mocks' do
  it '#bar' do
    #setup
    student = Student.new

    #verify
    expect(student).to receive(:bar)

    #exercise
    student.bar

    # Com mocks, o verify vem antes do exercise
  end

  it 'args' do
    student = Student.new
    expect(student).to receive(:foo).with(123)
    student.foo(123)
  end
end