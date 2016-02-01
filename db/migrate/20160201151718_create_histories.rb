class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :studee_id
      t.integer :absence
      t.integer :late
      t.integer :homework
      t.integer :voca

      t.timestamps null: false
    end
  end
end
