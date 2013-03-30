class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :response

      t.references :ticket
      t.references :staff
      t.references :status

      t.timestamps
    end
  end
end
