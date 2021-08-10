class Film < ApplicationRecord
  attr_reader :discount

  def add_discount(discount)
    @discount = discount
  end

  def attributes
    attrs = super.except('id')
    attrs['discount'] = discount
    attrs
  end
end