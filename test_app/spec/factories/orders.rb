FactoryBot.define do
  factory :order do
    sequence (:description) { |n| "Pedido Nº - #{n}"}
    customer # A factory já sabe que esse campo se trata de uma chave estrangeira (Associação belongs_to)
  end
end
