FactoryBot.define do
  factory :product do
    description { "MyString" }
    price { "9.99" }
    category # Ele já entende que se trata de um relacionamento
  end
end
