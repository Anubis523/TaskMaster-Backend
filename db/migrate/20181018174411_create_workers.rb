class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :username
      t.string :dept
      t.integer :employer_id
      t.timestamps
    end
  end
end
