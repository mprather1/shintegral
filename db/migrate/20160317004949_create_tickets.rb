class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ticket_no
      t.string :description
      t.date :eta
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
