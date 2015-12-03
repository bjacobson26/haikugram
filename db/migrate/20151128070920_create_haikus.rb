class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.string :title
      t.string :first_line
      t.string :second_line
      t.string :third_line

      t.timestamps null: false
    end
  end
end
