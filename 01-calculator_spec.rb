require 'calculator'

describe Calculator do # describe == Descreve um comportamento. Descreve o elemento que será testado

  # Equivale à calc = Calculator.new
  subject(:calc) { described_class.new() }

  # Caso o describe fosse 'Classe Calculadora', então a instanciação acima seria: subject(:calc) { Calculator.new() }

  context '#sum' do # context == É utilizado para descrever contextos, variações, maneiras diferentes de acontecer a funcionalidade. Esse bloco permite agrupar elementos de um mesmo contexto para serem testados
    it 'with positive numbers' do # it, specify ou example == É a expectativa do que deve acontecer no teste. É o que será testado.
      # calc = Calculator.new # Não precisa instanciar a classe, pois o rspec já faz isso no describe Calculator. Utilizamos o subject para referenciar o assunto contido no describe.
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'with negative and positive numbers' do
      result = calc.sum(-5, 7) # Aqui não estamos utilizando o subject porque fizemos a instanciação em subject(:calc).
      expect(result).to eq(2)
    end

    it 'with negative numbers' do
      result = calc.sum(-5, -7)
      expect(result).to eq(12)
    end
  end
end