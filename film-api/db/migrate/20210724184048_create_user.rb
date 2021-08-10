class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :token
      t.boolean :is_premium
    end
  end
end
