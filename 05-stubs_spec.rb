# Stubs: Forçar uma resposta específica para um determinado método de um objeto colaborador.

describe 'Stub' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true) # Force a classe Student, recebendo como parâmetro uma instância da classe Course, a retornar true quando ela receber o método has_finished?

    student.has_finished?(course) # Aqui é executado a permissão acima
  end
end

