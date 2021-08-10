# Definindo uma fábrica de objetos de teste

FactoryBot.define do
  factory :customer do

=begin Atributo transitório
    transient do
      upcased false
    end
=end
    name { Faker::Name.name }
    email { Faker::Internet.email }

    # Usando herança
    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    # Usando herança
    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    # Usando Traits
    # trait :male do
    #   gender 'M'
    # end

    # trait :female do
    #   gender 'F'
    # end

=begin Evento após criação do objeto da Factory
    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
=end    
  end
end
