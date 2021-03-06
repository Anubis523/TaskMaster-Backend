class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :username
      t.string :dept
      t.belongs_to :employer
      t.string :email
      t.string :password
      t.integer :assignment_id
      t.timestamps
    end
  end
end
