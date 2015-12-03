class AddUserToHaiku < ActiveRecord::Migration
  def change
    add_reference :haikus, :user, index: true
    add_foreign_key :haikus, :users
  end
end
