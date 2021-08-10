class User < ApplicationRecord
  def discount
    return 15 if is_premium?
    
    5
  end
end
