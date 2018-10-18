class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :desc
      t.integer :employer_id
      t.timestamps
    end
  end
end
