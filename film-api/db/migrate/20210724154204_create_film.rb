class CreateFilm < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name
      t.float :ticket_price
    end
  end
end
