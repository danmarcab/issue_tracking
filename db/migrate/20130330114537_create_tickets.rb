class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ref
      t.string :customer_name
      t.string :customer_email
      t.string :subject
      t.text :body

      t.references :department
      t.references :status
      t.references :staff

      t.timestamps
    end
  end
end
