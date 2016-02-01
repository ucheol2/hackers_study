class CreateStudees < ActiveRecord::Migration
  def change
    create_table :studees do |t|
      t.string :name
      t.integer :deposit, default: 30000
      t.integer :absence, default: 0
      t.integer :late, default: 0
      t.integer :homework, default: 0
      t.integer :voca, default: 0

      t.timestamps null: false
    end
  end
end
