class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :code
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
